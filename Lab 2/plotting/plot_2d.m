%% Parametric Gaussian

map = [240, 255, 219; % Region A
       207, 241, 255; % Region B
       255, 189, 201]; % Region C
map = map/255;

figure
hold on
title('Gaussian parametric classification for three classes');
xlabel('x1'); ylabel('x2');  

contourf(X,Y,ML_result, 'LineColor', '#ffaa00');
colormap(map);

scatter(data_2al(:,1),data_2al(:,2),25,'+', 'MarkerEdgeColor', '#77AC30');
scatter(data_2bl(:,1),data_2bl(:,2),25,'o', 'MarkerEdgeColor', '#4DBEEE');
scatter(data_2cl(:,1),data_2cl(:,2),25,'x', 'MarkerEdgeColor', '#A2142F');

% label decision regions
text(300,48,'R_{a}','Color','#385e06','FontSize',14,'FontWeight','bold');
text(150,100,'R_{b}','Color','#0377a8','FontSize',14,'FontWeight','bold');
text(50,275,'R_{c}','Color','#6e0015','FontSize',14,'FontWeight','bold');

gaussian_2d_lg = legend('ML boundary', 'Data a', 'Data b', 'Data c', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.5 0.75]);
title(gaussian_2d_lg, 'Legend')

%Plot ellipses 
% [evec_A, eval_A] = eig(cov_hat_a);
% theta_A = atan(evec_A(1,2)/evec_A(1,1));
% [evec_B, eval_B] = eig(cov_hat_b);
% theta_B = atan(evec_B(1,2)/evec_B(1,1));
% [evec_C, eval_C] = eig(cov_hat_c);
% theta_C = atan(evec_C(1,2)/evec_C(1,1));

% plot_ellipse(m_hat_a_2(1),m_hat_a_2(2),theta_A,sqrt(eval_A(1,1)),sqrt(eval_A(2,2)),'g');
% plot_ellipse(m_hat_b_2(1),m_hat_b_2(2),theta_B,sqrt(eval_B(1,1)),sqrt(eval_B(2,2)),'b');
% plot_ellipse(m_hat_c_2(1),m_hat_c_2(2),theta_C,sqrt(eval_C(1,1)),sqrt(eval_C(2,2)),'r');

%% Nonparametric

map = [240, 255, 219; % Region A
       207, 241, 255; % Region B
       255, 189, 201]; % Region C
map = map/255;

figure
hold on
title('Non-parametric classification for three classes using a Gaussian Parzen window');
xlabel('x1'); ylabel('x2');  

contourf(x_a_2,y_a_2,parz_decision, 'LineColor', '#ffaa00');
colormap(map);

scatter(data_2al(:,1),data_2al(:,2),25,'+', 'MarkerEdgeColor', '#77AC30');
scatter(data_2bl(:,1),data_2bl(:,2),25,'o', 'MarkerEdgeColor', '#4DBEEE');
scatter(data_2cl(:,1),data_2cl(:,2),25,'x', 'MarkerEdgeColor', '#A2142F');

%label decision regions
text(300,48,'R_{a}','Color','#385e06','FontSize',14,'FontWeight','bold');
text(150,100,'R_{b}','Color','#0377a8','FontSize',14,'FontWeight','bold');
text(50,275,'R_{c}','Color','#6e0015','FontSize',14,'FontWeight','bold');

parz_2d_lg = legend('ML boundary', 'Data a', 'Data b', 'Data c', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(parz_2d_lg, 'Legend')