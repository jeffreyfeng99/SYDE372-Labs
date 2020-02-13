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

           % sort distance array from shortest to longest 
           sorted_distances = sort(distances);
           k_sum = 0;

           % prototype calculation for Class 
           for z = 1:k
               k_sum = k_sum+sorted_distances(z);
           end

           k_mean = k_sum/k;
           decision_grid(i,j,m) = k_mean;
       end
   end
end

decision_grid = classify_data(decision_grid);

end