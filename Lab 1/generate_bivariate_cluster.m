function data = generate_bivariate_cluster(n, mu, covar)
    data = randn(n,2);
%     Method 1
    data = data*chol(covar) + repmat(mu,n,1);
%     Method 2
%     [V, D] = eig(covar);
%     D_inv = sqrt(D^(-1));
%     data = (V*inv(D_inv)*(data'))' + repmat(mu,n,1);
end
