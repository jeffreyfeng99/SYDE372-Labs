% Colormap of decision region
map = [255, 248, 230; % Region A
       244, 204, 252; % Region B
       255, 248, 230]; 
map = map/255;

%% First sequential discriminant
classes_1 = sequential_discriminant_classifier(G_1,N_aB_1,N_bA_1,grid);
classes_1 = reshape(classes_1,[size(X,1) size(X,2)]);

figure
hold on 
xlabel('x1'); ylabel('x2');
title('Decision Boundary of Sequential Discriminant Classifier 1');

% Contour decision boundary and shade in decision regions
contourf(X,Y,classes_1, 'LineColor','#000000');
colormap(map);
% label decision regions
text(110,375,'R_{A}','Color','#b58000','FontSize',14,'FontWeight','bold');
text(475,50,'R_{B}','Color','#530163','FontSize',14,'FontWeight','bold');

scatter(data_3a(:,1),data_3a(:,2));
scatter(data_3b(:,1),data_3b(:,2));

seq_dis1_lg = legend('Sequential discriminant decision boundary', 'Class A', 'Class B', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(seq_dis1_lg, 'Legend')


%% Second sequential discriminant
classes_2 = sequential_discriminant_classifier(G_2,N_aB_2,N_bA_2,grid);
classes_2 = reshape(classes_2,[size(X,1) size(X,2)]);

figure
hold on 
xlabel('x1'); ylabel('x2');
title('Decision Boundary of Sequential Discriminant Classifier 2');

% Contour decision boundary and shade in decision regions
contourf(X,Y,classes_2, 'LineColor','#000000');
colormap(map);
% label decision regions
text(110,375,'R_{A}','Color','#b58000','FontSize',14,'FontWeight','bold');
text(440,20,'R_{B}','Color','#530163','FontSize',14,'FontWeight','bold');

scatter(data_3a(:,1),data_3a(:,2));
scatter(data_3b(:,1),data_3b(:,2));

seq_dis2_lg = legend('Sequential discriminant decision boundary', 'Class A', 'Class B', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(seq_dis2_lg, 'Legend')


%% Third sequential discriminant
classes_3 = sequential_discriminant_classifier(G_3,N_aB_3,N_bA_3,grid);
classes_3 = reshape(classes_3,[size(X,1) size(X,2)]);

figure
hold on 
xlabel('x1'); ylabel('x2');
title('Decision Boundary of Sequential Discriminant Classifier 3');

% Contour decision boundary and shade in decision regions
contourf(X,Y,classes_3, 'LineColor','#000000');
colormap(map);
% label decision regions
text(110,350,'R_{A}','Color','#b58000','FontSize',14,'FontWeight','bold');
text(435,50,'R_{B}','Color','#530163','FontSize',14,'FontWeight','bold');

scatter(data_3a(:,1),data_3a(:,2));
scatter(data_3b(:,1),data_3b(:,2));

seq_dis3_lg = legend('Sequential discriminant decision boundary', 'Class A', 'Class B', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(seq_dis3_lg, 'Legend')
