%
% Plot the confusion charts for each classifier of each case
%

% Set true to automatically save figures
save_images = false;

case1_labels = ['A';'B'];
case2_labels = ['C';'D';'E'];

filepath = fullfile(strcat(pwd,'/confusion_charts/'));
if ~exist(filepath, 'dir')
   mkdir(filepath)
end

figure
confusionchart(C1_MED, case1_labels, 'Title', 'Case 1 MED');
if save_images, saveas(gcf, strcat(filepath,'C1_MED'),'png'); end

figure
confusionchart(C1_GED, case1_labels, 'Title', 'Case 1 GED');
if save_images, saveas(gcf, strcat(filepath,'C1_GED'),'png'); end

figure
confusionchart(C1_MAP, case1_labels, 'Title', 'Case 1 MAP');
if save_images, saveas(gcf, strcat(filepath,'C1_MAP'),'png'); end

figure
confusionchart(C1_NN, case1_labels, 'Title', 'Case 1 NN');
if save_images, saveas(gcf, strcat(filepath,'C1_NN'),'png'); end

figure
confusionchart(C1_5NN, case1_labels, 'Title', 'Case 1 5NN');
if save_images, saveas(gcf, strcat(filepath,'C1_5NN'),'png'); end

figure
confusionchart(C2_MED, case2_labels, 'Title', 'Case 2 MED');
if save_images, saveas(gcf, strcat(filepath,'C2_MED'),'png'); end

figure
confusionchart(C2_GED, case2_labels, 'Title', 'Case 2 GED');
if save_images, saveas(gcf, strcat(filepath,'C2_GED'),'png'); end

figure
confusionchart(C2_MAP, case2_labels, 'Title', 'Case 2 MAP');
if save_images, saveas(gcf, strcat(filepath,'C2_MAP'),'png'); end

figure
confusionchart(C2_NN, case2_labels, 'Title', 'Case 2 NN');
if save_images, saveas(gcf, strcat(filepath,'C2_NN'),'png'); end

figure
confusionchart(C2_5NN, case2_labels, 'Title', 'Case 2 5NN');
if save_images, saveas(gcf, strcat(filepath,'C2_5NN'),'png'); end
