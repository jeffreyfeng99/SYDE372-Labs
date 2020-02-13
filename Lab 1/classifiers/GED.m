%
% GED(mu, covar, X, Y)
%
% This method determines boundaries based on the MICD decision rule.
%
% Parameters
% mu: 3D matrix (1,2,n) containing the mean vectors of n classes 
% covar: 3D matrix (2,2,n) containing the covariance matrices of n classes 
% X: x-coordinates of sampling grid
% Y: y-coordinates of sampling grid
%

function decision_grid = GED(mu, covar, X, Y)

decision_grid = zeros([size(X),size(mu,3)]);

for i = 1:size(X,1)
   for j = 1:size(X,2)
       for k = 1:size(mu,3)
           XY_mu_ = [X(i,j)-mu(1,1,k) Y(i,j)-mu(1,2,k)];
           decision_grid(i,j,k) = XY_mu_*(covar(:,:,k)^(-1))*XY_mu_';
       end
   end
end

decision_grid = classify_data(decision_grid);

end