%
% Main script to generate clusters, classify data, and plot figures
%

clear all;
close all;
addpath('./classifiers', './cluster_generation', './error_analysis', './plotting');

% To maintain consistent prototyping (remove for actual testing)
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
step_size = 0.1; 

% Create a 2D grid of points for case 1
case1_x = [min(min(data_A(:,1)),min(data_B(:,1))):step_size:max(max(data_A(:,1)),max(data_B(:,1)))];
case1_y = [min(min(data_A(:,2)),min(data_B(:,2))):step_size:max(max(data_A(:,2)),max(data_B(:,2)))];
[case1_X,case1_Y] = meshgrid(case1_x,case1_y);

% Create a 2D grid of points for case 2
case2_x = [min([min(data_C(:,1)),min(data_D(:,1)),min(data_E(:,1))]):step_size:max([max(data_C(:,1)),max(data_D(:,1)),max(data_E(:,1))])];
case2_y = [min([min(data_C(:,2)),min(data_D(:,2)),min(data_E(:,2))]):step_size:max([max(data_C(:,2)),max(data_D(:,2)),max(data_E(:,2))])];
[case2_X,case2_Y] = meshgrid(case2_x,case2_y);

%% Calculate decision boundaries

% MED Decision Boundary for case 1
case1_MED = MED(c1_mu,case1_X,case1_Y);

% MED Decision Boundary for case 2
case2_MED = MED(c2_mu,case2_X,case2_Y);

% GED Decision Boundary for case 1
case1_GED = GED(c1_mu,c1_covar,case1_X,case1_Y);

% GED Decision Boundary for case 2
case2_GED = GED(c2_mu,c2_covar,case2_X,case2_Y);

% MAP Decision Boundary for case 1
case1_MAP = MAP(c1_mu,c1_covar,[n_A n_B],case1_X,case1_Y);

% MAP Decision Boundary for case 2 alternative method
case2_MAP = MAP(c2_mu,c2_covar,[n_C n_D n_E],case2_X,case2_Y);

% NN Decision Boundary for case 1
case1_NN = kNN({data_A,data_B},case1_X,case1_Y,1);

% NN Decision Boundary for case 2
case2_NN = kNN({data_C,data_D,data_E},case2_X,case2_Y,1);

% 5NN Decision Boundary for case 1
case1_5NN = kNN({data_A,data_B},case1_X,case1_Y,5);

% 5NN Decision Boundary for case 2
case2_5NN = kNN({data_C,data_D,data_E},case2_X,case2_Y,5);

%% Get confusion matrix and experimental error for each classifier

error_case_defn;

[C1_MED, case1_MED_error] = error_rate(case1_MED_error, [n_A n_B]);
[C1_GED, case1_GED_error] = error_rate(case1_GED_error, [n_A n_B]);
[C1_MAP, case1_MAP_error] = error_rate(case1_MAP_error, [n_A n_B]);
[C1_NN, case1_NN_error] = error_rate(case1_NN_error, [n_A n_B]);
[C1_5NN, case1_5NN_error] = error_rate(case1_5NN_error, [n_A n_B]);
[C2_MED, case2_MED_error] = error_rate(case2_MED_error, [n_C n_D n_E]);
[C2_GED, case2_GED_error] = error_rate(case2_GED_error, [n_C n_D n_E]);
[C2_MAP, case2_MAP_error] = error_rate(case2_MAP_error, [n_C n_D n_E]);
[C2_NN, case2_NN_error] = error_rate(case2_NN_error, [n_C n_D n_E]);
[C2_5NN, case2_5NN_error] = error_rate(case2_5NN_error, [n_C n_D n_E]);

%% Plotting 

plot_case_1;
plot_case_2;

%% Create confusion charts

plot_confusion_charts;
