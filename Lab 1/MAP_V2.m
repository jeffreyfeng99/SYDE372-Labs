function decision_grid = MAP_V2(mu,covar,num_samples, X, Y)

priors = num_samples/sum(num_samples); % priors based on class definitions
decision_grid = zeros([size(X),size(mu,3)]);

for i = 1:size(X,1)
   for j = 1:size(X,2)
       for k = 1:size(mu,3)
           XY_mu_ = [X(i,j)-mu(1,1,k) Y(i,j)-mu(1,2,k)];
           exp_term = exp(-1/2*(XY_mu_*(covar(:,:,k)^(-1))*XY_mu_'));
           
           decision_grid(i,j,k) = (priors(1)*exp_term)...
                                /((2*pi)*sqrt(det(covar(:,:,k))));
       end
   end
end

end