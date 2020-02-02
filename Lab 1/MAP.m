function decision_grid = MAP(mu_1, mu_2, covar_1, covar_2, num_samples_1,num_samples_2, X, Y)

prior_1 = (num_samples_1)/(num_samples_1 + num_samples_2);
prior_2 = (num_samples_2)/(num_samples_1 + num_samples_2);
threshold = 2*log(prior_1/prior_2) + log(det(covar_2)/det(covar_1));

decision_grid = zeros(size(X));

for i = 1:size(X,1)
   for j = 1:size(X,2)
       decision_grid(i,j) = [X(i,j)-mu_1(1) Y(i,j)-mu_1(2)]*(covar_1^(-1))*[X(i,j)-mu_1(1) Y(i,j)-mu_1(2)]' ...
                             - [X(i,j)-mu_2(1) Y(i,j)-mu_2(2)]*(covar_2^(-1))*[X(i,j)-mu_2(1) Y(i,j)-mu_2(2)]' ...
                             - threshold; 
   end
end
end