% Class A
n_A = 200;
mu_A = [5 10];
covar_A = [8 0;0 4];
[evec_A, eval_A] = eig(covar_A);
theta_A = atan(evec_A(1,2)/evec_A(1,1));

% Class B
n_B = 200;
mu_B = [10 15];
covar_B = [8 0;0 4];
[evec_B, eval_B] = eig(covar_B);
theta_B = atan(evec_B(1,2)/evec_B(1,1));

% Class C
n_C = 100;
mu_C = [5 10];
covar_C = [8 4;4 40];
[evec_C, eval_C] = eig(covar_C);
theta_C = atan(evec_C(1,2)/evec_C(1,1));

% Class D
n_D = 200;
mu_D = [15 10];
covar_D = [8 0;0 8];
[evec_D, eval_D] = eig(covar_D);
theta_D = atan(evec_D(1,2)/evec_D(1,1));

% Class E
n_E = 150;
mu_E = [10 5];
covar_E = [10 -5;-5 20];
[evec_E, eval_E] = eig(covar_E);
theta_E = atan(evec_E(1,2)/evec_E(1,1));
