%
% ML(mu, covar, X, Y)
%
% This method determines boundaries based on the ML decision rule.
%
% Parameters
% mu: 3D matrix (2,1,n) containing the mean vectors of n classes 
% covar: 3D matrix (2,2,n) containing the covariance matrices of n classes 
% X: x-coordinates of sampling grid
% Y: y-coordinates of sampling grid
%

function decision_grid = ML_Gaussian(mu,covar, X, Y)

decision_grid = zeros([size(X),size(mu,3)]);

% Efficienct (use mvnpdf)
XY_mu_ = [X(:) Y(:)];
for k = 1:size(mu,3)
    distribution = mvnpdf(XY_mu_, mu(:,1,k)', covar(:,:,k));
    distribution = reshape(distribution, size(X,1),size(X,2));
    decision_grid(:,:,k) = distribution;
end

% Inefficient (iterate)
% for i = 1:size(X,1)
%    for j = 1:size(X,2)
%        for k = 1:size(mu,3)
%            XY_mu_ = [X(i,j)-mu(1,1,k) Y(i,j)-mu(2,1,k)];
%            exp_term = exp(-1/2*(XY_mu_*(covar(:,:,k)^(-1))*XY_mu_'));
%            
%            decision_grid(i,j,k) = (exp_term)...
%                                 /((2*pi)*sqrt(det(covar(:,:,k))));
%        end
%    end
% end

decision_grid = classify_data(decision_grid, true);

end