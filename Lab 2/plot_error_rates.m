function plot_error_rates(data_3a, data_3b)

J=10;
iter=200;
error_rate = zeros(iter,J);
for i=1:iter
    
    for j=1:J
        %DOUBLE CHECK
        [G_j1, N_aB_j1, N_bA_j1] = MED_sequential_discriminant(data_3a, data_3b);
        if (size(G_j1, 2) < j) 
            error_rate(i,j) = 0;
        else
            classA_j = sequential_discriminant_classifier(G_j1(:,1:j),N_aB_j1(1:j),N_bA_j1(1:j),data_3a);
            classB_j = sequential_discriminant_classifier(G_j1(:,1:j),N_aB_j1(1:j),N_bA_j1(1:j),data_3b);
            error_rate(i,j) = length(find(classA_j == 0 | classA_j == -2)) + ...
                              length(find(classB_j == 1 | classB_j == -2));
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