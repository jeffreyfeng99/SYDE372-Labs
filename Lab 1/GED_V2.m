function decision_grid = GED_V2(mu, covar, X, Y)

decision_grid = zeros([size(X),size(mu,3)]);

for i = 1:size(X,1)
   for j = 1:size(X,2)
       for k = 1:size(mu,3)
           XY_mu_ = [X(i,j)-mu(1,1,k) Y(i,j)-mu(1,2,k)];
           decision_grid(i,j,k) = XY_mu_*(covar(:,:,k)^(-1))*XY_mu_';
       end
   end
end
end