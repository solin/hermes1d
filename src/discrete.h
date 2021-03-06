#ifndef _DISCRETE_H_
#define _DISCRETE_H_

#include <vector>

#include "mesh.h"
#include "quad_std.h"
#include "lobatto.h"
#include "matrix.h"

typedef double (*matrix_form) (int num, double *x, double *weights,
        double *u, double *dudx, double *v, double *dvdx, double *u_prev,
        double *du_prevdx, void *user_data);

typedef double (*vector_form) (int num, double *x, double *weights,
        double *u_prev, double *du_prevdx, double *v, double *dvdx,
        void *user_data);

typedef double (*matrix_form_surf) (double x, double u, double dudx, 
        double v, double dvdx, double u_prev, double du_prevdx, 
        void *user_data);

typedef double (*vector_form_surf) (double x, double u_prev, 
        double du_prevdx, double v, double dvdx,
        void *user_data);

class DiscreteProblem {

public:
    DiscreteProblem(int neq, Mesh *mesh);

    void add_matrix_form(int i, int j, matrix_form fn);
    void add_vector_form(int i, vector_form fn);
    void add_matrix_form_surf(int i, int j, matrix_form_surf fn, int bdy_index);
    void add_vector_form_surf(int i, vector_form_surf fn, int bdy_index);
    void process_vol_forms(Matrix *mat, double *res, double *y_prev, int matrix_flag);
    void process_surf_forms(Matrix *mat, double *res, double *y_prev, 
                            int matrix_flag, int bdy_index);
    void assemble(Matrix *mat, double *res, double *y_prev, int matrix_flag);
    void assemble_matrix_and_vector(Matrix *mat, double *res, double *y_prev); 
    void assemble_matrix(Matrix *mat, double *y_prev);
    void assemble_vector(double *res, double *y_prev);

private:
    int neq;
    Mesh *mesh;

	struct MatrixFormVol {
		int i, j;
		matrix_form fn;
	};
	struct MatrixFormSurf {
		int i, j, bdy_index;
		matrix_form_surf fn;
	};
	struct VectorFormVol {
		int i;
		vector_form fn;
	};
	struct VectorFormSurf {
		int i, bdy_index;
		vector_form_surf fn;
	};
	std::vector<MatrixFormVol> matrix_forms_vol;
	std::vector<MatrixFormSurf> matrix_forms_surf;
	std::vector<VectorFormVol> vector_forms_vol;
	std::vector<VectorFormSurf> vector_forms_surf;
};

void calculate_elem_coeffs(Mesh *mesh, int m, double *y_prev, double *coeffs);

void element_quadrature(double a, double b, 
                        int order, double *pts, double *weights, int *num);
void element_shapefn(double a, double b, 
		     int k, int order, double *val, double *der);
void element_shapefn_point(double x_ref, double a, double b, 
			   int k, double *val, double *der);

#endif
