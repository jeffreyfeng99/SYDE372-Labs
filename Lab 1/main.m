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
case1_MED = MED_V2(c1_mu,case1_X,case1_Y);
case1_MED = classify_data_V2(case1_MED);

% MED Decision Boundary for case 2
case2_MED = MED_V2(c2_mu,case2_X,case2_Y);
case2_MED = classify_data_V2(case2_MED);

% GED Decision Boundary for case 1
case1_GED = GED_V2(c1_mu,c1_covar,case1_X,case1_Y);
case1_GED = classify_data_V2(case1_GED);

% GED Decision Boundary for case 2
case2_GED = GED_V2(c2_mu,c2_covar,case2_X,case2_Y);
case2_GED = classify_data_V2(case2_GED);

% MAP Decision Boundary for case 1
case1_MAP = MAP_V2(c1_mu,c1_covar,[n_A n_B],case1_X,case1_Y);
case1_MAP = classify_data_V2(case1_MAP, true);

% MAP Decision Boundary for case 2 alternative method
case2_MAP = MAP_V2(c2_mu,c2_covar,[n_C n_D n_E],case2_X,case2_Y);
case2_MAP = classify_data_V2(case2_MAP, true);

% % NN Decision Boundary for case 1
% case1_NN = kNN_V2({data_A,data_B},case1_X,case1_Y,1);
% case1_NN = classify_data_V2(case1_NN);
% 
% % NN Decision Boundary for case 2
% case2_NN = kNN_V2({data_C,data_D,data_E},case2_X,case2_Y,1);
% case2_NN = classify_data_V2(case2_NN);
% 
% % 5NN Decision Boundary for case 1
% case1_5NN = kNN_V2({data_A,data_B},case1_X,case1_Y,5);
% case1_5NN = classify_data_V2(case1_5NN);
% 
% % 5NN Decision Boundary for case 2
% case2_5NN = kNN_V2({data_C,data_D,data_E},case2_X,case2_Y,5);
% case2_5NN = classify_data_V2(case2_5NN);

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
% Remove the code below this (this is just for current testing purposes)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Contour colours:
% GED: #661010
% MED: #00ffdd
% MAP: #ffaa00 (-- marker for Case 1 GED, MAP, MED)
% NN:  #495fd1
% 5NN: #e46aeb
% 
% Ellipse and highlighted mean colors:
% A: #D95319
% B: #ce52ff
% C: 'g'
% D: 'b'
% E: 'r'
%
% Data point colors and markers:
% A: #EDB120, x
% B: #7E2F8E, o
% C: #77AC30, + 
% D: #4DBEEE, o
% E: #A2142F, x

sz = 25;

% Plotting Case 1
figure
hold on
title('Case 1: GED, MED, MAP decision boundaries and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
contour(case1_X,case1_Y,case1_GED,[0.5,0.5], 'LineColor', '#661010', 'LineWidth',1);
contour(case1_X,case1_Y,case1_MED,[0.5,0.5], 'LineColor', '#00ffdd');
contour(case1_X,case1_Y,case1_MAP,[0.5,0.5], '--', 'LineColor', '#ffaa00');
plot_ellipse(mu_A(1),mu_A(2),theta_A,sqrt(eval_A(1,1)),sqrt(eval_A(2,2)), '#D95319');
plot_ellipse(mu_B(1),mu_B(2),theta_B,sqrt(eval_B(1,1)),sqrt(eval_B(2,2)), '#ce52ff');

% Scatter data points
scatter(data_A(:,1),data_A(:,2),sz,'x', 'MarkerEdgeColor', '#EDB120')
scatter(data_B(:,1),data_B(:,2),sz,'o', 'MarkerEdgeColor', '#7E2F8E')

% highlight means
scatter(mu_A(1),mu_A(2),sz, 'MarkerFaceColor', '#D95319', ...
                            'MarkerEdgeColor', '#D95319'); 
scatter(mu_B(1),mu_B(2),sz, 'MarkerFaceColor', '#ce52ff', ...
                            'MarkerEdgeColor', '#ce52ff');

c1_lg_1 = legend('GED boundary', 'MED boundary', 'MAP boundary', ...
                 'Data A Ellipse', 'Data B Ellipse', ...
                 'Data A', 'Data B', 'Data A Mean', 'Data B Mean', ...
                 'NumColumns', 2, 'Location', 'northwest');
title(c1_lg_1, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off
axis equal

% figure
% hold on
% title('Case 1: Nearest Neighbour and 5-Nearest Neighbour decision boundaries');
% xlabel('x1'); ylabel('x2')                     
% 
% % Plot decision boundary
% contour(case1_X,case1_Y,case1_NN,[0.5,0.5], 'LineColor', '#495fd1');
% contour(case1_X,case1_Y,case1_5NN,[0.5,0.5], 'LineColor', '#e46aeb');
% 
% % Scatter data points
% scatter(data_A(:,1),data_A(:,2),sz,'x', 'MarkerEdgeColor', '#EDB120')
% scatter(data_B(:,1),data_B(:,2),sz,'o', 'MarkerEdgeColor', '#7E2F8E')
% 
% c1_lg_2 = legend('NN boundary', '5-NN boundary', 'Data A', 'Data B', ...
%                  'Location', 'northwest');
% title(c1_lg_2, 'Legend')
% set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% hold off
% axis equal

% Plotting Case 2
figure
hold on
title('Case 2: GED, MED, MAP decision boundaries and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
contour(case2_X,case2_Y,case2_GED, [0.5,1.5], 'LineColor', '#661010');
contour(case2_X,case2_Y,case2_MED, [0.5,1.5], 'LineColor', '#00ffdd');
contour(case2_X,case2_Y,case2_MAP, [0.5,1.5], 'LineColor', '#ffaa00');
plot_ellipse(mu_C(1),mu_C(2),theta_C,sqrt(eval_C(1,1)),sqrt(eval_C(2,2)),'g');
plot_ellipse(mu_D(1),mu_D(2),theta_D,sqrt(eval_D(1,1)),sqrt(eval_D(2,2)),'b');
plot_ellipse(mu_E(1),mu_E(2),theta_E,sqrt(eval_E(1,1)),sqrt(eval_E(2,2)),'r');

% scatter data points
scatter(data_C(:,1),data_C(:,2),sz,'+', 'MarkerEdgeColor', '#77AC30')
scatter(data_D(:,1),data_D(:,2),sz,'o', 'MarkerEdgeColor', '#4DBEEE')
scatter(data_E(:,1),data_E(:,2),sz,'x', 'MarkerEdgeColor', '#A2142F')

% highlight means
scatter(mu_C(1),mu_C(2),sz, 'MarkerFaceColor', 'g', ...
                            'MarkerEdgeColor', 'g'); 
scatter(mu_D(1),mu_D(2),sz, 'MarkerFaceColor', 'b', ...
                            'MarkerEdgeColor', 'b');
scatter(mu_E(1),mu_E(2),sz, 'MarkerFaceColor', 'r', ...
                            'MarkerEdgeColor', 'r');

c2_lg_1 = legend('GED boundary', 'MED boundary', 'MAP boundary', ...
                 'Data C Ellipse', 'Data D Ellipse', 'Data E Ellipse', ...
                 'Data C', 'Data D', 'Data E', ...
                 'Data C Mean', 'Data D Mean', 'Data E Mean', ...
                 'NumColumns', 2, 'Location', 'northwest');
title(c2_lg_1, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off

% figure
% hold on
% title('Case 2: Nearest Neighbour and 5-Nearest Neighbour decision boundaries');
% xlabel('x1'); ylabel('x2')  
% 
% % Plot decision boundary
% contour(case2_X,case2_Y,case2_NN,[0.5,0.5], 'LineColor', '#495fd1');
% contour(case2_X,case2_Y,case2_5NN,[0.5,0.5], 'LineColor', '#e46aeb');
% 
% % Scatter data points
% scatter(data_C(:,1),data_C(:,2),sz,'+', 'MarkerEdgeColor', '#77AC30')
% scatter(data_D(:,1),data_D(:,2),sz,'o', 'MarkerEdgeColor', '#4DBEEE')
% scatter(data_E(:,1),data_E(:,2),sz,'x', 'MarkerEdgeColor', '#A2142F')
% 
% c2_lg_2 = legend('NN boundary', '5-NN boundary', 'Data C', 'Data D', 'Data E', ...
%                  'Location', 'northwest');
% title(c2_lg_2, 'Legend')
% set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% hold off
% axis equal
%%
plot_confusion_charts;
