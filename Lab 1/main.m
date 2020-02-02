% clear all;
% close all;

class_defn;

data_A = generate_bivariate_cluster(n_A,mu_A,covar_A);
data_B = generate_bivariate_cluster(n_B,mu_B,covar_B);
data_C = generate_bivariate_cluster(n_C,mu_C,covar_C);
data_D = generate_bivariate_cluster(n_D,mu_D,covar_D);
data_E = generate_bivariate_cluster(n_E,mu_E,covar_E);

% Remove the code below this (this is just for current testing purposes)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
plot_ellipse(mu_A(1),mu_A(2),theta_A,sqrt(eval_A(1,1)),sqrt(eval_A(2,2)));
plot_ellipse(mu_B(1),mu_B(2),theta_B,sqrt(eval_B(1,1)),sqrt(eval_B(2,2)));
scatter(data_A(:,1), data_A(:,2))
scatter(data_B(:,1), data_B(:,2))
hold off
axis equal

figure
hold on
plot_ellipse(mu_C(1),mu_C(2),theta_C,sqrt(eval_C(1,1)),sqrt(eval_C(2,2)));
plot_ellipse(mu_D(1),mu_D(2),theta_D,sqrt(eval_D(1,1)),sqrt(eval_D(2,2)));
plot_ellipse(mu_E(1),mu_E(2),theta_E,sqrt(eval_E(1,1)),sqrt(eval_E(2,2)));
scatter(data_C(:,1), data_C(:,2))
scatter(data_D(:,1), data_D(:,2))
scatter(data_E(:,1), data_E(:,2))
hold off
axis equal