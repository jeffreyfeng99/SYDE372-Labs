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
           distances = zeros(size(data{m},1),1);
           % get distance between (X,Y) point and all Class sample points
           for a = 1:size(data{m},1)
               dist = norm([X(i,j) Y(i,j)] - data{m}(a,:));
               distances(a) = dist;         
           end

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