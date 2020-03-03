%
% Plot the class samples and decision boundaries for case 1
%

% Contour colours:
% GED: #000000
% MED: #00ffdd
% MAP: #ffaa00 (-- marker for Case 1 GED, MAP, MED)
% NN:  #495fd1
% 5NN: #e46aeb
% 
% Ellipse and highlighted mean colors:
% A: #D95319
% B: #ce52ff
%
% Data point colors and markers:
% A: #bd7b00, x
% B: #7E2F8E, o

% Size of markers
sz = 25;

% Colormap of decision region
map = [255, 248, 230; % Region A
       244, 204, 252; % Region B
       244, 204, 252]; 
map = map/255;

%% Plot Sample Data for Case 1
figure
hold on
title('Case 1: Data, means, and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellips
plot_ellipse(mu_A(1),mu_A(2),theta_A,sqrt(eval_A(1,1)),sqrt(eval_A(2,2)), '#D95319');
plot_ellipse(mu_B(1),mu_B(2),theta_B,sqrt(eval_B(1,1)),sqrt(eval_B(2,2)), '#ce52ff');

% Scatter data points
scatter(data_A(:,1),data_A(:,2),sz,'x', 'MarkerEdgeColor', '#bd7b00')
scatter(data_B(:,1),data_B(:,2),sz,'o', 'MarkerEdgeColor', '#7E2F8E')

% highlight means
scatter(mu_A(1),mu_A(2),sz, 'MarkerFaceColor', '#D95319', ...
                            'MarkerEdgeColor', '#D95319'); 
scatter(mu_B(1),mu_B(2),sz, 'MarkerFaceColor', '#ce52ff', ...
                            'MarkerEdgeColor', '#ce52ff');

c1_lg_data = legend('Data A Ellipse', 'Data B Ellipse', ...
                 'Data A', 'Data B', 'Data A Mean', 'Data B Mean', ...
                 'Location', 'northwestoutside');
title(c1_lg_data, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off

%% Plot Case 1 GED classifier
figure
hold on
title('Case 1: GED decision boundary and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
contourf(case1_X,case1_Y,case1_GED, 'LineColor', '#000000');
colormap(map);

plot_ellipse(mu_A(1),mu_A(2),theta_A,sqrt(eval_A(1,1)),sqrt(eval_A(2,2)), '#D95319');
plot_ellipse(mu_B(1),mu_B(2),theta_B,sqrt(eval_B(1,1)),sqrt(eval_B(2,2)), '#ce52ff');

% Scatter data points
scatter(data_A(:,1),data_A(:,2),sz,'x', 'MarkerEdgeColor', '#bd7b00')
scatter(data_B(:,1),data_B(:,2),sz,'o', 'MarkerEdgeColor', '#7E2F8E')

% highlight means
scatter(mu_A(1),mu_A(2),sz, 'MarkerFaceColor', '#D95319', ...
                            'MarkerEdgeColor', '#D95319'); 
scatter(mu_B(1),mu_B(2),sz, 'MarkerFaceColor', '#ce52ff', ...
                            'MarkerEdgeColor', '#ce52ff');

% label decision regions
text(12,7,'R_{A}','Color','#b58000','FontSize',14,'FontWeight','bold');
text(0,18,'R_{B}','Color','#530163','FontSize',14,'FontWeight','bold');

c1_lg_GED = legend('GED boundary', ...
                 'Data A Ellipse', 'Data B Ellipse', ...
                 'Data A', 'Data B', 'Data A Mean', 'Data B Mean', ...
                 'Location', 'northwestoutside');
title(c1_lg_GED, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off
axis equal

%% Plot Case 1 MED classifier
figure
hold on
title('Case 1: MED decision boundary and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
contourf(case1_X,case1_Y,case1_MED, 'LineColor', '#00ffdd');
colormap(map);

plot_ellipse(mu_A(1),mu_A(2),theta_A,sqrt(eval_A(1,1)),sqrt(eval_A(2,2)), '#D95319');
plot_ellipse(mu_B(1),mu_B(2),theta_B,sqrt(eval_B(1,1)),sqrt(eval_B(2,2)), '#ce52ff');

% Scatter data points
scatter(data_A(:,1),data_A(:,2),sz,'x', 'MarkerEdgeColor', '#bd7b00')
scatter(data_B(:,1),data_B(:,2),sz,'o', 'MarkerEdgeColor', '#7E2F8E')

% highlight means
scatter(mu_A(1),mu_A(2),sz, 'MarkerFaceColor', '#D95319', ...
                            'MarkerEdgeColor', '#D95319'); 
scatter(mu_B(1),mu_B(2),sz, 'MarkerFaceColor', '#ce52ff', ...
                            'MarkerEdgeColor', '#ce52ff');

% label decision regions
text(-1,7,'R_{A}','Color','#b58000','FontSize',14,'FontWeight','bold');
text(6,19,'R_{B}','Color','#530163','FontSize',14,'FontWeight','bold');

c1_lg_MED = legend('MED boundary', ...
                 'Data A Ellipse', 'Data B Ellipse', ...
                 'Data A', 'Data B', 'Data A Mean', 'Data B Mean', ...
                 'Location', 'northwestoutside');
title(c1_lg_MED, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off
axis equal

%% Plot Case 1 MAP classifier
figure
hold on
title('Case 1: MAP decision boundary and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
contourf(case1_X,case1_Y,case1_MAP, '--', 'LineColor', '#ffaa00');
colormap(map);

plot_ellipse(mu_A(1),mu_A(2),theta_A,sqrt(eval_A(1,1)),sqrt(eval_A(2,2)), '#D95319');
plot_ellipse(mu_B(1),mu_B(2),theta_B,sqrt(eval_B(1,1)),sqrt(eval_B(2,2)), '#ce52ff');

% Scatter data points
scatter(data_A(:,1),data_A(:,2),sz,'x', 'MarkerEdgeColor', '#bd7b00')
scatter(data_B(:,1),data_B(:,2),sz,'o', 'MarkerEdgeColor', '#7E2F8E')

% highlight means
scatter(mu_A(1),mu_A(2),sz, 'MarkerFaceColor', '#D95319', ...
                            'MarkerEdgeColor', '#D95319'); 
scatter(mu_B(1),mu_B(2),sz, 'MarkerFaceColor', '#ce52ff', ...
                            'MarkerEdgeColor', '#ce52ff');

% label decision regions
text(12,7,'R_{A}','Color','#b58000','FontSize',14,'FontWeight','bold');
text(0,18,'R_{B}','Color','#530163','FontSize',14,'FontWeight','bold');
                        
c1_lg_MAP = legend('MAP boundary', ...
                 'Data A Ellipse', 'Data B Ellipse', ...
                 'Data A', 'Data B', 'Data A Mean', 'Data B Mean', ...
                 'Location', 'northwestoutside');
title(c1_lg_MAP, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off
axis equal

%% Plot Case 1 GED, MED, and MAP Comparison
figure
hold on
title('Case 1: GED, MED, MAP decision boundaries and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
contour(case1_X,case1_Y,case1_GED,[0.5,0.5], 'LineColor', '#000000', 'LineWidth',1.5);
contour(case1_X,case1_Y,case1_MED,[0.5,0.5], 'LineColor', '#00ffdd', 'LineWidth',1.5);
contour(case1_X,case1_Y,case1_MAP,[0.5,0.5], '--', 'LineColor', '#ffaa00', 'LineWidth',1.5);
plot_ellipse(mu_A(1),mu_A(2),theta_A,sqrt(eval_A(1,1)),sqrt(eval_A(2,2)), '#D95319');
plot_ellipse(mu_B(1),mu_B(2),theta_B,sqrt(eval_B(1,1)),sqrt(eval_B(2,2)), '#ce52ff');

% Scatter data points
scatter(data_A(:,1),data_A(:,2),sz,'x', 'MarkerEdgeColor', '#bd7b00')
scatter(data_B(:,1),data_B(:,2),sz,'o', 'MarkerEdgeColor', '#7E2F8E')

% highlight means
scatter(mu_A(1),mu_A(2),sz, 'MarkerFaceColor', '#D95319', ...
                            'MarkerEdgeColor', '#D95319'); 
scatter(mu_B(1),mu_B(2),sz, 'MarkerFaceColor', '#ce52ff', ...
                            'MarkerEdgeColor', '#ce52ff');

c1_lg_comp = legend('GED boundary', 'MED boundary', 'MAP boundary', ...
                 'Data A Ellipse', 'Data B Ellipse', ...
                 'Data A', 'Data B', 'Data A Mean', 'Data B Mean', ...
                 'Location', 'northwestoutside');
title(c1_lg_comp, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off
axis equal

%% Plot Case 1 NN decision boundary
figure
hold on
title('Case 1: Nearest Neighbour decision boundary');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary
contourf(case1_X,case1_Y,case1_NN, 'LineColor', '#495fd1');
colormap(map);

% Scatter data points
scatter(data_A(:,1),data_A(:,2),sz,'x', 'MarkerEdgeColor', '#bd7b00')
scatter(data_B(:,1),data_B(:,2),sz,'o', 'MarkerEdgeColor', '#7E2F8E')

% label decision regions
text(12,7,'R_{A}','Color','#b58000','FontSize',14,'FontWeight','bold');
text(0,18,'R_{B}','Color','#530163','FontSize',14,'FontWeight','bold');

c1_lg_NN = legend('NN boundary', 'Data A', 'Data B', ...
                 'Location', 'northwestoutside');
title(c1_lg_NN, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off

%% Plot Case 1 5-NN decision boundary
figure
hold on
title('Case 1: 5-Nearest Neighbour decision boundary');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary
contourf(case1_X,case1_Y,case1_5NN, 'LineColor', '#e46aeb');
colormap(map);

% Scatter data points
scatter(data_A(:,1),data_A(:,2),sz,'x', 'MarkerEdgeColor', '#bd7b00')
scatter(data_B(:,1),data_B(:,2),sz,'o', 'MarkerEdgeColor', '#7E2F8E')

% label decision regions
text(12,7,'R_{A}','Color','#b58000','FontSize',14,'FontWeight','bold');
text(0,18,'R_{B}','Color','#530163','FontSize',14,'FontWeight','bold');

c1_lg_5NN = legend('5-NN boundary', 'Data A', 'Data B', ...
                 'Location', 'northwestoutside');
title(c1_lg_5NN, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off

%% Plot Case 1 NN and 5-NN decision boundaries
figure
hold on
title('Case 1: Nearest Neighbour and 5-Nearest Neighbour decision boundaries');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary
contour(case1_X,case1_Y,case1_NN,[0.5,0.5], 'LineColor', '#495fd1', 'LineWidth',1.5);
contour(case1_X,case1_Y,case1_5NN,[0.5,0.5], 'LineColor', '#e46aeb', 'LineWidth',1.5);

% Scatter data points
scatter(data_A(:,1),data_A(:,2),sz,'x', 'MarkerEdgeColor', '#bd7b00')
scatter(data_B(:,1),data_B(:,2),sz,'o', 'MarkerEdgeColor', '#7E2F8E')

c1_lg_comp2 = legend('NN boundary', '5-NN boundary', 'Data A', 'Data B', ...
                 'Location', 'northwestoutside');
title(c1_lg_comp2, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off
