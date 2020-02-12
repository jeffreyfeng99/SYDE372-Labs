function decision_grid = MAP(mu_1, mu_2, covar_1, covar_2, num_samples_1,num_samples_2, X, Y)
% Creates a decision grid for a two-class case based on MAP

prior_1 = (num_samples_1)/(num_samples_1 + num_samples_2);
prior_2 = (num_samples_2)/(num_samples_1 + num_samples_2);
threshold = 2*log(prior_1/prior_2) + log(det(covar_2)/det(covar_1));

inv_covar_1 = covar_1^(-1);
inv_covar_2 = covar_2^(-1);
decision_grid = zeros(size(X));

for i = 1:size(X,1)
   for j = 1:size(X,2)
       xy_u1_ = [X(i,j)-mu_1(1) Y(i,j)-mu_1(2)];
       xy_u1_T = xy_u1_';
       xy_u2_ = [X(i,j)-mu_2(1) Y(i,j)-mu_2(2)];
       xy_u2_T = xy_u2_';
       
       decision_grid(i,j) = xy_u1_*inv_covar_1*xy_u1_T ...
                             - xy_u2_*inv_covar_2*xy_u2_T ...
                             - threshold; 
   end
end

end