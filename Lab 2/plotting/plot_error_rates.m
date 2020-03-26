%
% plot_error_rates(data_A, data_B)
%
% This function plots various error rate results given two datasets based
% on their sequential discriminant classifiers. J is a tunable variable
% that limits the number of classifiers that a sequential classifier can
% have. iter is a tunable variable that specifies how many times a
% classifier is to be learned.
%
% Parameters 
% data_A: first dataset
% data_B: second dataset
%

function plot_error_rates(data_A, data_B)

J=5;
iter=20;
error_rate = zeros(iter,J);

for j=1:J
    for i=1:iter
        [G_j1, N_aB_j1, N_bA_j1] = MED_sequential_discriminant(data_A, data_B);
        if (size(G_j1, 2) < j) 
            error_rate(i,j) = 0;
        else
            classA_j = sequential_discriminant_classifier(G_j1(:,1:j),N_aB_j1(1:j),N_bA_j1(1:j),data_A);
            classB_j = sequential_discriminant_classifier(G_j1(:,1:j),N_aB_j1(1:j),N_bA_j1(1:j),data_B);
            error_rate(i,j) = length(find(classA_j == 1 | classA_j == -1)) + ...
                              length(find(classB_j == 0 | classB_j == -1));
        end
    end
end

error_rate = error_rate/400;
avg_error_rate = sum(error_rate,1)/iter;
min_error_rate = min(error_rate,[],1);
max_error_rate = max(error_rate,[],1);
std_error_rate = std(error_rate,0,1);

figure
hold on
xlabel('j'); ylabel('Error Rate');
title('Various Error Rate Results as a Function of j');

j = 1:J;
plot(j,avg_error_rate, '-o');
plot(j,min_error_rate, '-o');
plot(j,max_error_rate, '-o');
plot(j,std_error_rate, '-o');

error_lg = legend('Average', 'Min', 'Max', 'Std', ...
                 'Location', 'northeast');
title(error_lg, 'Legend')
hold off

end