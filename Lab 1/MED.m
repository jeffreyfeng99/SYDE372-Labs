function decision_grid = MED(mu_1, mu_2, X, Y)
% Creates a decision grid for a two-class case based on MED

decision_grid = zeros(size(X));

for i = 1:size(X,1)
   for j = 1:size(X,2)
       gx_k = [X(i,j)-mu_1(1) Y(i,j)-mu_1(2)]*[X(i,j)-mu_1(1) Y(i,j)-mu_1(2)]';
       gx_l = [X(i,j)-mu_2(1) Y(i,j)-mu_2(2)]*[X(i,j)-mu_2(1) Y(i,j)-mu_2(2)]';
       
       decision_grid(i,j) = gx_k - gx_l;
   end
end
end