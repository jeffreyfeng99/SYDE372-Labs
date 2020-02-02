function decision_grid = MAP_V2(mu_1, mu_2,mu_3, covar_1, covar_2,covar_3,num_samples_1,num_samples_2,num_samples_3, X, Y)

total_samples = (num_samples_1 + num_samples_2 + num_samples_3);
prior_1 = (num_samples_1)/(total_samples);
prior_2 = (num_samples_2)/(total_samples);
prior_3 = (num_samples_3)/(total_samples);

decision_grid = zeros(size(X));

for i = 1:size(X,1)
   for j = 1:size(X,2)
       posterior_1 = (prior_1 * exp(-1/2*([X(i,j)-mu_1(1) Y(i,j)-mu_1(2)]*(covar_1^(-1))*[X(i,j)-mu_1(1) Y(i,j)-mu_1(2)]')))...
                            / ((2*pi)*sqrt(det(covar_1)));
       
       posterior_2 = (prior_2 * exp(-1/2*([X(i,j)-mu_2(1) Y(i,j)-mu_2(2)]*(covar_2^(-1))*[X(i,j)-mu_2(1) Y(i,j)-mu_2(2)]')))...
                            / ((2*pi)*sqrt(det(covar_2)));
       
       posterior_3 = (prior_3 * exp(-1/2*([X(i,j)-mu_3(1) Y(i,j)-mu_3(2)]*(covar_3^(-1))*[X(i,j)-mu_3(1) Y(i,j)-mu_3(2)]')))...
                            / ((2*pi)*sqrt(det(covar_3)));
       
       if posterior_1 > posterior_2 && posterior_1 > posterior_3
           decision_grid(i,j) = 0;
       elseif posterior_2 > posterior_1 && posterior_2 > posterior_3
           decision_grid(i,j) = 1;
       elseif posterior_3 > posterior_1 && posterior_3 > posterior_2
           decision_grid(i,j) = 2;
       end
   end
end
end