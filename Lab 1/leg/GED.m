function decision_grid = GED(mu_1, mu_2, covar_1, covar_2, X, Y)

decision_grid = zeros(size(X));

for i = 1:size(X,1)
   for j = 1:size(X,2)
       decision_grid(i,j) = [X(i,j)-mu_1(1) Y(i,j)-mu_1(2)]*(covar_1^(-1))*[X(i,j)-mu_1(1) Y(i,j)-mu_1(2)]' ...
                             - [X(i,j)-mu_2(1) Y(i,j)-mu_2(2)]*(covar_2^(-1))*[X(i,j)-mu_2(1) Y(i,j)-mu_2(2)]'; 
   end
end
end