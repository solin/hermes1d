#include "hermes1d.h"
#include "solver_umfpack.h"

// ********************************************************************

// This example solves the Poisson equation -u'' - f = 0 in
// an interval (A, B), equipped with Dirichlet boundary
// conditions on both end points. 

// General input:
static int N_eq = 1;
int N_elem = 3;                         // number of elements
double A = 0, B = 2*M_PI;               // domain end points
int P_init = 3;                         // initial polynomal degree

// Boundary conditions
double Val_dir_left = 1;                // Dirichlet condition left
double Val_dir_right = 1;               // Dirichlet condition right

// Tolerance for the Newton's method
double TOL = 1e-5;

// Function f(x)
double f(double x) {
  return sin(x);
  //return 1;
}

// ********************************************************************

// bilinear form for the Jacobi matrix 
// num...number of Gauss points in element
// x[]...Gauss points
// weights[]...Gauss weights for points in x[]
// u...basis function
// v...test function
// u_prev...previous solution (all solution components)
double jacobian(int num, double *x, double *weights, 
                double *u, double *dudx, double *v, double *dvdx, 
                double u_prev[MAX_EQN_NUM][MAX_PTS_NUM], double du_prevdx[MAX_EQN_NUM][MAX_PTS_NUM], 
                void *user_data)
{
  double val = 0;
  for(int i = 0; i<num; i++) {
    val += dudx[i]*dvdx[i]*weights[i];
  }
  return val;
};

// (nonlinear) form for the residual vector
// num...number of Gauss points in element
// x[]...Gauss points
// weights[]...Gauss weights for points in x[]
// u...approximate solution
// v...test function
// u_prev...previous solution (all solution components)
double residual(int num, double *x, double *weights, 
                double u_prev[MAX_EQN_NUM][MAX_PTS_NUM], double du_prevdx[MAX_EQN_NUM][MAX_PTS_NUM],  
                double *v, double *dvdx, void *user_data)
{
  double val = 0;
  for(int i = 0; i<num; i++) {
    val += (du_prevdx[0][i]*dvdx[i] - f(x[i])*v[i])*weights[i];
  }
  return val;
};

/******************************************************************************/
int main() {
  // create mesh
  Mesh mesh(A, B, N_elem, P_init, N_eq);
  mesh.set_bc_left_dirichlet(0, Val_dir_left);
  mesh.set_bc_right_dirichlet(0, Val_dir_right);
  int N_dof = mesh.assign_dofs();
  printf("N_dof = %d\n", N_dof);

  // register weak forms
  DiscreteProblem dp(&mesh);
  dp.add_matrix_form(0, 0, jacobian);
  dp.add_vector_form(0, residual);

  // allocate Jacobi matrix and residual
  Matrix *mat;
  double *y_prev = new double[N_dof];
  double *res = new double[N_dof];

  // zero initial condition for the Newton's method
  for(int i=0; i<N_dof; i++) y_prev[i] = 0; 

  // Newton's loop
  int newton_iterations = 0;
  while (1) {
    // zero the matrix:
    mat = new CooMatrix(N_dof);

    // construct residual vector
    dp.assemble_matrix_and_vector(mat, res, y_prev); 

    // calculate L2 norm of residual vector
    double res_norm = 0;
    for(int i=0; i<N_dof; i++) res_norm += res[i]*res[i];
    res_norm = sqrt(res_norm);

    // if residual norm less than TOL, quit
    // latest solution is in y_prev
    printf("Residual L2 norm: %.15f\n", res_norm);
    if(res_norm < TOL) break;

    // changing sign of vector res
    for(int i=0; i<N_dof; i++) res[i]*= -1;

    // solving the matrix system
    solve_linear_system_umfpack((CooMatrix*)mat, res);

    // updating y_prev by new solution which is in res
    for(int i=0; i<N_dof; i++) y_prev[i] += res[i];

    newton_iterations++;
    printf("Finished Newton iteration: %d\n", newton_iterations);
  }

  Linearizer l(&mesh);
  const char *out_filename = "solution.gp";
  l.plot_solution(out_filename, y_prev);

  printf("Done.\n");
  return 1;
}
