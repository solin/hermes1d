#include "hermes1d.h"
#include "solver_umfpack.h"

// ********************************************************************
// This example solves the mathematical pendulum equation 
// y'' + k**2 * sin(y) = 0 in an interval (A, B), equipped with the 
// initial conditions y(A) = Init_angle, y'(0) = Init_vel. The 
// system is decomposed into two first order ODE and solved via 
// the Newton's method starting from zero initial condition.
// Note that the method diverges for longer time intervals, 
// depending on the interval length, number of elements, and 
// the initial polynomial degree.
//
// Derivation:
// m*l*u'' = -m*g*sin(u)
// so:
// u'' + k^2 * sin(u) = 0
// with k^2 = g/l
// so we have to solve a system of two nonlinear second-order equations
// v' + k^2 sin u = 0
// u' - v = 0
// in an interval (0, 2*pi) equipped with Dirichlet bdy conditions
// u(0) = 0, v(0) = k
// The approximate (linearized) solution is u(x) = sin(k*x), v(x) = k*cos(k*x)

// General input:
static int N_eq = 2;
int N_elem = 1292;          // number of elements
double A = 0, B = 10;     // domain end points
int P_init = 1;            // initial polynomal degree
double k = 0.5;

// Tolerance for the Newton's method
double TOL = 1e-5;

// Boundary conditions
double Init_angle = M_PI/2.;      // initial angle
double Init_vel = 0;              // initial velocity

// ********************************************************************

// Jacobi matrix block 0, 0 (equation 0, solution component 0)
// Note: u_prev[c][i] contains the values of solution component c 
// in integration point x[i]. similarly for du_prevdx.
double jacobian_0_0(int num, double *x, double *weights, 
                double *u, double *dudx, double *v, double *dvdx, 
                double u_prev[MAX_EQN_NUM][MAX_PTS_NUM], 
                double du_prevdx[MAX_EQN_NUM][MAX_PTS_NUM], 
                void *user_data)
{
  double val = 0;
  for(int i = 0; i<num; i++) {
    val += dudx[i]*v[i]*weights[i];
  }
  return val;
};

// Jacobi matrix block 0, 1 (equation 0, solution component 1)
double jacobian_0_1(int num, double *x, double *weights, 
                double *u, double *dudx, double *v, double *dvdx, 
                double u_prev[MAX_EQN_NUM][MAX_PTS_NUM], 
                double du_prevdx[MAX_EQN_NUM][MAX_PTS_NUM], 
                void *user_data)
{
  double val = 0;
  for(int i = 0; i<num; i++) {
    val -= u[i]*v[i]*weights[i];
  }
  return val;
};

// Jacobi matrix block 1, 0 (equation 1, solution component 0)
double jacobian_1_0(int num, double *x, double *weights, 
                double *u, double *dudx, double *v, double *dvdx, 
                double u_prev[MAX_EQN_NUM][MAX_PTS_NUM], 
                double du_prevdx[MAX_EQN_NUM][MAX_PTS_NUM], 
                void *user_data)
{
  double val = 0;
  for(int i = 0; i<num; i++) {
    val += k*k * cos(u_prev[0][i])*u[i]*v[i]*weights[i];
  }
  return val;
};

// Jacobi matrix block 1, 1 (equation 1, solution component 1)
double jacobian_1_1(int num, double *x, double *weights, 
                double *u, double *dudx, double *v, double *dvdx, 
                double u_prev[MAX_EQN_NUM][MAX_PTS_NUM], 
                double du_prevdx[MAX_EQN_NUM][MAX_PTS_NUM], 
                void *user_data)
{
  double val = 0;
  for(int i = 0; i<num; i++) {
    val += dudx[i]*v[i]*weights[i];
  }
  return val;
};

// Residual part 0 (equation 0)
double residual_0(int num, double *x, double *weights, 
                double u_prev[MAX_EQN_NUM][MAX_PTS_NUM], 
                double du_prevdx[MAX_EQN_NUM][MAX_PTS_NUM], 
                double *v, double *dvdx, void *user_data)
{
  double val = 0;
  for(int i = 0; i<num; i++) {
    val += (du_prevdx[0][i]*v[i] - u_prev[1][i]*v[i])*weights[i];
  }
  return val;
};

// Residual part 1 (equation 1) 
double residual_1(int num, double *x, double *weights, 
                double u_prev[MAX_EQN_NUM][MAX_PTS_NUM], 
                double du_prevdx[MAX_EQN_NUM][MAX_PTS_NUM], 
                double *v, double *dvdx, void *user_data)
{
  double val = 0;
  for(int i = 0; i<num; i++) {
    val += (k*k*sin(u_prev[0][i])*v[i] + du_prevdx[1][i]*v[i])*weights[i];
  }
  return val;
};

/******************************************************************************/
int main() {
  // create mesh
  Mesh mesh(A, B, N_elem, P_init, N_eq);
  mesh.set_bc_left_dirichlet(0, Init_angle);
  mesh.set_bc_left_dirichlet(1, Init_vel);
  int N_dof = mesh.assign_dofs();
  printf("N_dof = %d\n", N_dof);

  // register weak forms
  DiscreteProblem dp(&mesh);
  dp.add_matrix_form(0, 0, jacobian_0_0);
  dp.add_matrix_form(0, 1, jacobian_0_1);
  dp.add_matrix_form(1, 0, jacobian_1_0);
  dp.add_matrix_form(1, 1, jacobian_1_1);
  dp.add_vector_form(0, residual_0);
  dp.add_vector_form(1, residual_1);

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
    printf("Residual L2 norm: %g\n", res_norm);

    // if residual norm less than TOL, quit
    // latest solution is in y_prev
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
