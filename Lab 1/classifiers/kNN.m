%
% kNN(data, X, Y)
%
% This method determines boundaries based on the kNN decision rule.
%
% Parameters
% data: cell array (n) containing the samples points from n classes
% X: x-coordinates of sampling grid
% Y: y-coordinates of sampling grid
%

function decision_grid = kNN(data,X,Y,k)

decision_grid = zeros([size(X), length(data)]);

for i = 1:size(X,1)
   for j = 1:size(X,2)
       for m = 1:length(data)
           % get Class Prototype
           % get distance between (X,Y) point and all Class sample points
           distances = sqrt((X(i,j)- data{m}(:,1)).^2 + (Y(i,j)-data{m}(:,2)).^2);
            
           % sort distance array from shortest to longest and retrieve corresponding indices
           [~, sortIdx] = sort(distances);
           
           % prototype calculation for Class 
           k_sum = zeros(1,2);
           for z = 1:k
               k_sum = k_sum+data{m}(sortIdx(z),:);
           end

           k_mean = k_sum/k;
           decision_grid(i,j,m) = sqrt((X(i,j)- k_mean(1))^2 + (Y(i,j)-k_mean(2))^2);
       end
   end
end

decision_grid = classify_data(decision_grid);

end