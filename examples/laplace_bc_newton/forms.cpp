// bilinear form for the Jacobi matrix 
// num...number of Gauss points in element
// x[]...Gauss points
// weights[]...Gauss weights for points in x[]
// u...basis function
// v...test function
// u_prev...previous solution
double jacobian_vol(int num, double *x, double *weights, 
                double *u, double *dudx, double *v, double *dvdx, 
                double u_prev[MAX_EQN_NUM][MAX_QUAD_PTS_NUM], 
                double du_prevdx[MAX_EQN_NUM][MAX_QUAD_PTS_NUM],  
                void *user_data)
{
  double val = 0;
  for(int i = 0; i<num; i++) {
    val += dudx[i]*dvdx[i]*weights[i];
  }
  return val;
};

double residual_vol(int num, double *x, double *weights, 
                double u_prev[MAX_EQN_NUM][MAX_QUAD_PTS_NUM], 
                double du_prevdx[MAX_EQN_NUM][MAX_QUAD_PTS_NUM], 
                double *v, double *dvdx, void *user_data)
{
  double val = 0;
  for(int i = 0; i<num; i++) {
    val += (du_prevdx[0][i]*dvdx[i] - f(x[i])*v[i])*weights[i];
  }
  return val;
};

double jacobian_surf_right(double x, double u, double dudx,
        double v, double dvdx, double u_prev[MAX_EQN_NUM], 
        double du_prevdx[MAX_EQN_NUM], void *user_data)
{
  return (1./Val_newton_alpha)*u*v;
}

double residual_surf_right(double x, double u_prev[MAX_EQN_NUM], 
        double du_prevdx[MAX_EQN_NUM], double v,
        double dvdx, void *user_data)
{
  return ((u_prev[0] - Val_newton_beta)/Val_newton_alpha) * v; 
}
