clear all;
close all;

% To maintain consistent prototyping - remove for actual evaluations
seed = 5;
rng(seed)

% Define statistical parameters for each class
class_defn;

% Generate the clusters and transform the data points
data_A = generate_bivariate_cluster(n_A,mu_A,covar_A);
data_B = generate_bivariate_cluster(n_B,mu_B,covar_B);
data_C = generate_bivariate_cluster(n_C,mu_C,covar_C);
data_D = generate_bivariate_cluster(n_D,mu_D,covar_D);
data_E = generate_bivariate_cluster(n_E,mu_E,covar_E);

% Sampling rate - lower for higher resolution
step_size = 0.25; 

% Create a 2D grid of points for case 1
case1_x = [min(min(data_A(:,1)),min(data_B(:,1))):step_size:max(max(data_A(:,1)),max(data_B(:,1)))];
case1_y = [min(min(data_A(:,2)),min(data_B(:,2))):step_size:max(max(data_A(:,2)),max(data_B(:,2)))];
[case1_X,case1_Y] = meshgrid(case1_x,case1_y);

% Create a 2D grid of points for case 1
case2_x = [min([min(data_C(:,1)),min(data_D(:,1)),min(data_E(:,1))]):step_size:max([max(data_C(:,1)),max(data_D(:,1)),max(data_E(:,1))])];
case2_y = [min([min(data_C(:,2)),min(data_D(:,2)),min(data_E(:,2))]):step_size:max([max(data_C(:,2)),max(data_D(:,2)),max(data_E(:,2))])];
[case2_X,case2_Y] = meshgrid(case2_x,case2_y);

% MED Decision Boundary for case 1
case1_MED = MED_V2(cat(3,mu_A,mu_B),case1_X,case1_Y);
case1_MED = classify_data_V2(case1_MED);

% MED Decision Boundary for case 2
case2_MED = MED_V2(cat(3,mu_C,mu_D,mu_E),case2_X,case2_Y);
case2_MED = classify_data_V2(case2_MED);

% GED Decision Boundary for case 1
case1_GED = GED_V2(cat(3,mu_A,mu_B),cat(3,covar_A,covar_B),case1_X,case1_Y);
case1_GED = classify_data_V2(case1_GED);

% GED Decision Boundary for case 2
case2_GED = GED_V2(cat(3,mu_C,mu_D,mu_E),cat(3,covar_C,covar_D,covar_E),case2_X,case2_Y);
case2_GED = classify_data_V2(case2_GED);

% MAP Decision Boundary for case 1
case1_MAP = MAP_V2(cat(3,mu_A,mu_B),cat(3,covar_A,covar_B),[size(data_A,1), size(data_B,1)],case1_X,case1_Y);
case1_MAP = classify_data_V2(case1_MAP, true);

% MAP Decision Boundary for case 2 alternative method
case2_MAP = MAP_V2(cat(3,mu_C,mu_D,mu_E),cat(3,covar_C,covar_D,covar_E),[size(data_C,1),size(data_D,1),size(data_E,1)],case2_X,case2_Y);
case2_MAP = classify_data_V2(case2_MAP, true);

% NN Decision Boundary for case 1
case1_NN = kNN_V2({data_A,data_B},case1_X,case1_Y,1);
case1_NN = classify_data_V2(case1_NN);

% NN Decision Boundary for case 2
case2_NN = kNN_V2({data_C,data_D,data_E},case2_X,case2_Y,1);
case2_NN = classify_data_V2(case2_NN);

% 5NN Decision Boundary for case 1
case1_5NN = kNN_V2({data_A,data_B},case1_X,case1_Y,5);
case1_5NN = classify_data_V2(case1_5NN);

% 5NN Decision Boundary for case 2
case2_5NN = kNN_V2({data_C,data_D,data_E},case2_X,case2_Y,5);
case2_5NN = classify_data_V2(case2_5NN);

% Remove the code below this (this is just for current testing purposes)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%plotting Case 1
figure
hold on
contour(case1_X,case1_Y,case1_GED,[0.5,0.5], 'r');
contour(case1_X,case1_Y,case1_MED,[0.5,0.5], 'b');
contour(case1_X,case1_Y,case1_MAP,[0.5,0.5], 'g');
plot_ellipse(mu_A(1),mu_A(2),theta_A,sqrt(eval_A(1,1)),sqrt(eval_A(2,2)));
plot_ellipse(mu_B(1),mu_B(2),theta_B,sqrt(eval_B(1,1)),sqrt(eval_B(2,2)));
scatter(data_A(:,1), data_A(:,2))
scatter(data_B(:,1), data_B(:,2))
hold off
axis equal

figure('Name','Case 1 NN (Red) and KNN (Blue)')
hold on
contour(case1_X,case1_Y,case1_NN,[0.5,0.5], 'r');
contour(case1_X,case1_Y,case1_5NN,[0.5,0.5], 'b');
scatter(data_A(:,1), data_A(:,2),'g')
scatter(data_B(:,1), data_B(:,2),'m')
hold off
axis equal

%plotting case 2
figure
hold on
contour(case2_X,case2_Y,case2_GED, [0.5,1.5],'r');
contour(case2_X,case2_Y,case2_MED, [0.5,1.5],'b');
contour(case2_X,case2_Y,case2_MAP, [0.5,1.5],'g');
plot_ellipse(mu_C(1),mu_C(2),theta_C,sqrt(eval_C(1,1)),sqrt(eval_C(2,2)));
plot_ellipse(mu_D(1),mu_D(2),theta_D,sqrt(eval_D(1,1)),sqrt(eval_D(2,2)));
plot_ellipse(mu_E(1),mu_E(2),theta_E,sqrt(eval_E(1,1)),sqrt(eval_E(2,2)));
scatter(data_C(:,1), data_C(:,2))
scatter(data_D(:,1), data_D(:,2))
scatter(data_E(:,1), data_E(:,2))
hold off

figure
hold on
contour(case2_X,case2_Y,case2_NN, [0.5,1.5],'g');
contour(case2_X,case2_Y,case2_5NN, [0.5,1.5],'m');
scatter(data_C(:,1), data_C(:,2),'r')
scatter(data_D(:,1), data_D(:,2),'b')
scatter(data_E(:,1), data_E(:,2))
hold off
axis equal