%
% generate_bivariate_cluster(n, mu, covar)
%
% Randomly generate clusters of data based on given statistical parameters.
%
% Parameters
% n: number of samples
% mu: mean
% covar: covariance matrix
%
% Returns
% data: row vector of n sample points for each class
%

function data = generate_bivariate_cluster(n, mu, covar)

data = randn(n,2);

% Method 1
data = data*chol(covar) + repmat(mu',n,1);

% Method 2
% [V, D] = eig(covar);
% D_inv = sqrt(D^(-1));
% data = (V*(D_inv^(-1))*(data'))' + repmat(mu',n,1);

end
