%
% Plot the confusion charts for each classifier of each case
%

case1_labels = ['A';'B'];
case2_labels = ['C';'D';'E'];

filepath = fullfile(strcat(pwd,'/confusion_charts/'));

figure
confusionchart(C1_MED, case1_labels, 'Title', 'Case 1 MED');
saveas(gcf, strcat(filepath,'C1_MED'),'png');

figure
confusionchart(C1_GED, case1_labels, 'Title', 'Case 1 GED');
saveas(gcf, strcat(filepath,'C1_GED'),'png');

figure
confusionchart(C1_MAP, case1_labels, 'Title', 'Case 1 MAP');
saveas(gcf, strcat(filepath,'C1_MAP'),'png');

figure
confusionchart(C1_NN, case1_labels, 'Title', 'Case 1 NN');
saveas(gcf, strcat(filepath,'C1_NN'),'png');

figure
confusionchart(C1_5NN, case1_labels, 'Title', 'Case 1 5NN');
saveas(gcf, strcat(filepath,'C1_5NN'),'png');

figure
confusionchart(C2_MED, case2_labels, 'Title', 'Case 2 MED');
saveas(gcf, strcat(filepath,'C2_MED'),'png');

figure
confusionchart(C2_GED, case2_labels, 'Title', 'Case 2 GED');
saveas(gcf, strcat(filepath,'C2_GED'),'png');

figure
confusionchart(C2_MAP, case2_labels, 'Title', 'Case 2 MAP');
saveas(gcf, strcat(filepath,'C2_MAP'),'png');

figure
confusionchart(C2_NN, case2_labels, 'Title', 'Case 2 NN');
saveas(gcf, strcat(filepath,'C2_NN'),'png');

figure
confusionchart(C2_5NN, case2_labels, 'Title', 'Case 2 5NN');
saveas(gcf, strcat(filepath,'C2_5NN'),'png');
