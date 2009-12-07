// Copyright (c) 2009 hp-FEM group at the University of Nevada, Reno (UNR).
// Distributed under the terms of the BSD license (see the LICENSE
// file for the exact terms).
// Email: hermes1d@googlegroups.com, home page: http://hpfem.org/

#include "transforms.h"

#define N_proj_max (3+2*(MAX_P-1))
typedef double ProjectionMatrix[N_proj_max][N_proj_max];
typedef double TransformationMatrix[N_proj_max][MAX_P+1];

TransformationMatrix transformation_matrix;
int transformation_matrix_initialized=0;

// transform values from (-1, 0) to (-1, 1)
#define map_left(x) (2*x+1)
// transform values from (0, 1) to (-1, 1)
#define map_right(x) (2*x-1)

double phi(int i, double x)
{
    if (x < 0) {
        if (i == 0)
            return lobatto_fn_tab_1d[0](map_left(x));
        else if (i % 2 == 0)
            return 0;
        else
            return lobatto_fn_tab_1d[(i+1)/2](map_left(x));
    } else {
        if (i == 0)
            return 0;
        else if (i == 1)
            return lobatto_fn_tab_1d[0](map_right(x));
        else if (i % 2 == 1)
            return 0;
        else {
            return lobatto_fn_tab_1d[i/2](map_right(x));
        }
    } 
}

double projection_inner_product(double i, double j, int right, int order)
{
    double phys_x[MAX_PTS_NUM];                  // quad points
    double phys_weights[MAX_PTS_NUM];              // quad weights
    int    pts_num = 0;
    if (right) {
        create_element_quadrature(0, 1, order, phys_x, phys_weights,
                &pts_num); 
    } else {
        create_element_quadrature(-1, 0, order, phys_x, phys_weights,
                &pts_num); 
    }

    double result = 0;
    for (int k=0; k < pts_num; k++ )
        result += phys_weights[k] * (phi(i, phys_x[k]) * phi(j, phys_x[k]));

    return result;
}

double projection_rhs_integral(int j_coarse, int i_fine, int right, int order)
{
    double phys_x[MAX_PTS_NUM];                  // quad points
    double phys_weights[MAX_PTS_NUM];              // quad weights
    int    pts_num = 0;
    if (right) {
        create_element_quadrature(0, 1, order, phys_x, phys_weights,
                &pts_num); 
    } else {
        create_element_quadrature(-1, 0, order, phys_x, phys_weights,
                &pts_num); 
    }

    double result = 0;
    for (int k=0; k < pts_num; k++ )
        result += phys_weights[k] * (lobatto_fn_tab_1d[j_coarse](phys_x[k]) *
                phi(i_fine, phys_x[k]));

    return result;
}


void fill_projection_matrix(int n, ProjectionMatrix *proj_matrix)
{
    int order=N_proj_max*2;
    int left = 0, right = 1;
    for (int i=0; i < n; i++) {
        for (int j=0; j < n; j++) {
	  (*proj_matrix)[i][j] = 
	     // both the i-th and j-th functions are on the fine element
             projection_inner_product(i, j, left, order) +
             projection_inner_product(i, j, right, order); 
        }
        //printf("\n");
    }
    //error("stop.");
}

void fill_transformation_matrix(TransformationMatrix
        transformation_matrix)
{
    int order=N_proj_max+MAX_P;
    int left = 0, right = 1;
    ProjectionMatrix proj_matrix;
    int n = N_proj_max;
    fill_projection_matrix(n, &proj_matrix);

    // loop over shape functions on coarse element
    for (int j=0; j < MAX_P; j++) {
        // FIXME: don't compute the matrix all the time, e.g.  move this out of
        // the cycle and make sure the gaussian elimination doesn't overwrite
        // the _mat.
        Matrix *_mat = new DenseMatrix(n);
        _mat->zero();
        for (int _i=0; _i < n; _i++)
            for (int _j=0; _j < n; _j++)
                _mat->add(_i, _j, proj_matrix[_i][_j]);
        // fill right-hand side vector for j-th shape function on coarse element 
        double f[n];
        for (int i=0; i < n; i++)
	  f[i] = projection_rhs_integral(j, i, left, order) +
                 projection_rhs_integral(j, i, right, order);
        // solve linear system to obtain another column in transformation matrix
        solve_linear_system(_mat, f);
        for (int i=0; i < n; i++)
            transformation_matrix[i][j] = f[i];
    }
    /*
    for (int i=0; i < n; i++) {
        for (int j=0; j < p+1; j++) {
            printf("%f ", transformation_matrix[i][j]);
        }
        printf("\n");
    }
    //error("stop.");
    */
}


void transform_element_refined(int comp, double *y_prev, double *y_prev_ref, Element
        *e, Element *e_ref_left, Element *e_ref_right, Mesh *mesh, Mesh
        *mesh_ref)
{
    //printf("ELEMENT: %d %f %f\n", e->id, e->x1, e->x2);
    double y_prev_loc[MAX_P+1];
    double y_prev_loc_trans[N_proj_max+1];
    if (e->dof[comp][0] == -1)
        y_prev_loc[0] = mesh->bc_left_dir_values[comp];
    else
        y_prev_loc[0] = y_prev[e->dof[comp][0]];
    if (e->dof[comp][1] == -1)
        y_prev_loc[1] = mesh->bc_right_dir_values[comp];
    else
        y_prev_loc[1] = y_prev[e->dof[comp][1]];
    for (int i=2; i < e->p + 1; i++)
        y_prev_loc[i] = y_prev[e->dof[comp][i]];
    /*
    for (int i=0; i < e->p + 1; i++)
        printf("y_prev_loc[%d] = %f\n", i, y_prev_loc[i]);
        */
    if (transformation_matrix_initialized == 0) {
        fill_transformation_matrix(transformation_matrix);
        transformation_matrix_initialized=1;
    }
    //fill_transformation_matrix();
    //double TransformationMatrix *transformation_matrix =
    //    get_transformation_matrix(e_ref_left->p + 1);
    for (int i=0; i < 3 + 2*(e_ref_left->p - 1); i++) {
        y_prev_loc_trans[i] = 0.;
        for (int j=0; j < e->p + 1; j++)
            y_prev_loc_trans[i] += transformation_matrix[i][j] * y_prev_loc[j];
    }
    /*
    for (int i=0; i < 3 + 2*(e_ref_left->p - 1); i++)
        printf("y_prev_loc_trans[%d] = %f\n", i, y_prev_loc_trans[i]);
    printf("----------------------\n");
    */
    // copying computed coefficients into the elements e_ref_left and
    // e_ref_right
    if (e->dof[comp][0] != -1)
        y_prev_ref[e_ref_left->dof[comp][0]] = y_prev_loc_trans[0];
    y_prev_ref[e_ref_left->dof[comp][1]] = y_prev_loc_trans[1];
    y_prev_ref[e_ref_right->dof[comp][0]] = y_prev_loc_trans[1];
    if (e->dof[comp][1] != -1)
        y_prev_ref[e_ref_right->dof[comp][1]] = y_prev_loc_trans[2];
    if (e_ref_left->p != e_ref_right->p)
        error("internal error in transform_element: the left and right elements must have the same order.");
    int counter = 0;
    for (int p=2; p < e_ref_left->p + 1; p++) {
        y_prev_ref[e_ref_left->dof[comp][p]] = y_prev_loc_trans[3+counter];
        counter++;
        y_prev_ref[e_ref_right->dof[comp][p]] = y_prev_loc_trans[3+counter];
        counter++;
    }
}

void transform_element_unrefined(int comp, double *y_prev, double *y_prev_ref, Element
        *e, Element *e_ref, Mesh *mesh, Mesh *mesh_ref)
{
    for (int p=0; p < e->p + 1; p++) {
        if (e->dof[comp][p] != -1)
            y_prev_ref[e_ref->dof[comp][p]] = y_prev[e->dof[comp][p]];
    }
    for (int p=e->p+1; p < e_ref->p + 1; p++) {
        y_prev_ref[e_ref->dof[comp][p]] = 0.;
    }
}

/* This only works after the dofs are assigned in the reference (and coarse)
 * solution. */
void transfer_solution(Mesh *mesh, Mesh *mesh_ref, double *y_prev, double *y_prev_ref)
{
    Iterator *I = new Iterator(mesh);
    Iterator *I_ref = new Iterator(mesh_ref);
    Element *e, *e_ref, *e_ref_left, *e_ref_right;
    for (int comp=0; comp < mesh->get_n_eq(); comp++) {
        I->reset();
        I_ref->reset();
        while ((e = I->next_active_element()) != NULL) {
            e_ref = I_ref->next_active_element();
            if (e->level == e_ref->level)
                transform_element_unrefined(comp, y_prev, y_prev_ref, e,
                    e_ref, mesh, mesh_ref);
            else if (e->level + 1 == e_ref->level) {
                e_ref_left = e_ref;
                e_ref_right = I_ref->next_active_element();
                transform_element_refined(comp, y_prev, y_prev_ref, e,
                    e_ref_left, e_ref_right, mesh, mesh_ref);
            }
            else
                error("internal error in transfer_solution: element orders mismatch.");
        }
    }
}
