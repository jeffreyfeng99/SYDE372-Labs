%
% Plot the class samples and decision boundaries for case 2
%

% Contour colours:
% GED: #000000
% MED: #00ffdd
% MAP: #ffaa00 
% NN:  #495fd1
% 5NN: #e46aeb
% 
% Ellipse and highlighted mean colors:
% C: 'g'
% D: 'b'
% E: 'r'
%
% Data point colors and markers:
% C: #77AC30, + 
% D: #4DBEEE, o
% E: #A2142F, x

% Size of markers
sz = 25;

% Colormap of decision regions
map = [240, 255, 219; % Region C
       207, 241, 255; % Region D
       255, 189, 201]; % Region E
map = map/255;

%% Plot Sample Data for Case 2
figure
hold on
title('Case 2: Data, means, and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
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
                        
c2_lg_data = legend('Data C Ellipse', 'Data D Ellipse', 'Data E Ellipse', ...
                 'Data C', 'Data D', 'Data E', ...
                 'Data C Mean', 'Data D Mean', 'Data E Mean', ...
                 'Location', 'northwestoutside');
title(c2_lg_data, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off

%% Plot Case 2 GED classifier
figure
hold on
title('Case 2: GED decision boundary and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
contourf(case2_X,case2_Y,case2_GED, 'LineColor', '#000000');
colormap(map);

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
                        
% label decision regions
text(0,20,'R_{C}','Color','#385e06','FontSize',14,'FontWeight','bold');
text(20,20,'R_{D}','Color','#0377a8','FontSize',14,'FontWeight','bold');
text(20,-5,'R_{E}','Color','#6e0015','FontSize',14,'FontWeight','bold');

c2_lg_GED = legend('GED boundary', ...
                 'Data C Ellipse', 'Data D Ellipse', 'Data E Ellipse', ...
                 'Data C', 'Data D', 'Data E', ...
                 'Data C Mean', 'Data D Mean', 'Data E Mean', ...
                 'Location', 'northwestoutside');
title(c2_lg_GED, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off

%% Plot Case 2 MED Classifier
figure
hold on
title('Case 2: MED decision boundary and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
contourf(case2_X,case2_Y,case2_MED, 'LineColor', '#00ffdd');
colormap(map);

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

% label decision regions
text(0,20,'R_{C}','Color','#385e06','FontSize',14,'FontWeight','bold');
text(20,20,'R_{D}','Color','#0377a8','FontSize',14,'FontWeight','bold');
text(20,-5,'R_{E}','Color','#6e0015','FontSize',14,'FontWeight','bold');

c2_lg_MED = legend('MED boundary', ...
                 'Data C Ellipse', 'Data D Ellipse', 'Data E Ellipse', ...
                 'Data C', 'Data D', 'Data E', ...
                 'Data C Mean', 'Data D Mean', 'Data E Mean', ...
                 'Location', 'northwestoutside');
title(c2_lg_MED, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off

%% Plot Case 2 MAP Classifier
figure
hold on
title('Case 2: MAP decision boundary and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
contourf(case2_X,case2_Y,case2_MAP, 'LineColor', '#ffaa00');
colormap(map);

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
                        
% label decision regions
text(0,20,'R_{C}','Color','#385e06','FontSize',14,'FontWeight','bold');
text(20,20,'R_{D}','Color','#0377a8','FontSize',14,'FontWeight','bold');
text(20,-5,'R_{E}','Color','#6e0015','FontSize',14,'FontWeight','bold');

c2_lg_MAP = legend('MAP boundary', ...
                 'Data C Ellipse', 'Data D Ellipse', 'Data E Ellipse', ...
                 'Data C', 'Data D', 'Data E', ...
                 'Data C Mean', 'Data D Mean', 'Data E Mean', ...
                 'Location', 'northwestoutside');
title(c2_lg_MAP, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off

%% Plot Case 2 GED, MED, and MAP Compairson
figure
hold on
title('Case 2: GED, MED, MAP decision boundaries and ellipse contours');
xlabel('x1'); ylabel('x2')                     

% Plot decision boundary and equiprobability ellipse
contour(case2_X,case2_Y,case2_GED, [0.5,1.5], 'LineColor', '#000000', 'LineWidth',1.5);
contour(case2_X,case2_Y,case2_MED, [0.5,1.5], 'LineColor', '#00ffdd', 'LineWidth',1.5);
contour(case2_X,case2_Y,case2_MAP, [0.5,1.5], 'LineColor', '#ffaa00', 'LineWidth',1.5);
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

c2_lg_comp = legend('GED boundary', 'MED boundary', 'MAP boundary', ...
                 'Data C Ellipse', 'Data D Ellipse', 'Data E Ellipse', ...
                 'Data C', 'Data D', 'Data E', ...
                 'Data C Mean', 'Data D Mean', 'Data E Mean', ...
                 'Location', 'northwestoutside');
title(c2_lg_comp, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off
axis equal

%% Plot Case 2 NN decision boundary
figure
hold on
title('Case 2: Nearest Neighbour decision boundary');
xlabel('x1'); ylabel('x2')  

% Plot decision boundary
contourf(case2_X,case2_Y,case2_NN, 'LineColor', '#495fd1');
colormap(map);

% Scatter data points
scatter(data_C(:,1),data_C(:,2),sz,'+', 'MarkerEdgeColor', '#77AC30')
scatter(data_D(:,1),data_D(:,2),sz,'o', 'MarkerEdgeColor', '#4DBEEE')
scatter(data_E(:,1),data_E(:,2),sz,'x', 'MarkerEdgeColor', '#A2142F')

% label decision regions
text(0,20,'R_{C}','Color','#385e06','FontSize',14,'FontWeight','bold');
text(20,20,'R_{D}','Color','#0377a8','FontSize',14,'FontWeight','bold');
text(20,-5,'R_{E}','Color','#6e0015','FontSize',14,'FontWeight','bold');

c2_lg_NN = legend('NN boundary', 'Data C', 'Data D', 'Data E', ...
                 'Location', 'northwestoutside');
title(c2_lg_NN, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off

%% Plot Case 2 5-NN decision boundary
figure
hold on
title('Case 2: 5-Nearest Neighbours decision boundary');
xlabel('x1'); ylabel('x2')  

% Plot decision boundary
contourf(case2_X,case2_Y,case2_5NN, 'LineColor', '#e46aeb');
colormap(map);

% Scatter data points
scatter(data_C(:,1),data_C(:,2),sz,'+', 'MarkerEdgeColor', '#77AC30')
scatter(data_D(:,1),data_D(:,2),sz,'o', 'MarkerEdgeColor', '#4DBEEE')
scatter(data_E(:,1),data_E(:,2),sz,'x', 'MarkerEdgeColor', '#A2142F')

% label decision regions
text(0,20,'R_{C}','Color','#385e06','FontSize',14,'FontWeight','bold');
text(20,20,'R_{D}','Color','#0377a8','FontSize',14,'FontWeight','bold');
text(20,-5,'R_{E}','Color','#6e0015','FontSize',14,'FontWeight','bold');

c2_lg_5NN = legend('5-NN boundary', 'Data C', 'Data D', 'Data E', ...
                 'Location', 'northwestoutside');
title(c2_lg_5NN, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off

%% Plot Case 2 NN and 5-NN decision boundaries
figure
hold on
title('Case 2: Nearest Neighbour and 5-Nearest Neighbour decision boundaries');
xlabel('x1'); ylabel('x2')  

% Plot decision boundary
contour(case2_X,case2_Y,case2_NN, [0.5 1.5], 'LineColor', '#495fd1', 'LineWidth', 1.5);
contour(case2_X,case2_Y,case2_5NN, [0.5 1.5], 'LineColor', '#e46aeb', 'LineWidth', 1.5);

% Scatter data points
scatter(data_C(:,1),data_C(:,2),sz,'+', 'MarkerEdgeColor', '#77AC30')
scatter(data_D(:,1),data_D(:,2),sz,'o', 'MarkerEdgeColor', '#4DBEEE')
scatter(data_E(:,1),data_E(:,2),sz,'x', 'MarkerEdgeColor', '#A2142F')

c2_lg_comp2 = legend('NN boundary', '5-NN boundary', 'Data C', 'Data D', 'Data E', ...
                 'Location', 'northwestoutside');
title(c2_lg_comp2, 'Legend')
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
hold off