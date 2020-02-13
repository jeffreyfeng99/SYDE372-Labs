%
% MAP(mu, covar, num_samples, X, Y)
%
% This method determines boundaries based on the MAP decision rule.
%
% Parameters
% mu: 3D matrix (1,2,n) containing the mean vectors of n classes 
% covar: 3D matrix (2,2,n) containing the covariance matrices of n classes 
% num_samples: vector (n) containing the number of samples in n classes
% X: x-coordinates of sampling grid
% Y: y-coordinates of sampling grid
%

function decision_grid = MAP(mu,covar,num_samples, X, Y)

priors = num_samples/sum(num_samples); % priors based on class definitions
decision_grid = zeros([size(X),size(mu,3)]);

for i = 1:size(X,1)
   for j = 1:size(X,2)
       for k = 1:size(mu,3)
           XY_mu_ = [X(i,j)-mu(1,1,k) Y(i,j)-mu(1,2,k)];
           exp_term = exp(-1/2*(XY_mu_*(covar(:,:,k)^(-1))*XY_mu_'));
           
           decision_grid(i,j,k) = (priors(k)*exp_term)...
                                /((2*pi)*sqrt(det(covar(:,:,k))));
       end
   end
end

decision_grid = classify_data(decision_grid, true);

end