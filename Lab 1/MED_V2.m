function decision_grid = MED_V2(mu, X, Y)

decision_grid = zeros([size(X),size(mu,3)]);

for i = 1:size(X,1)
   for j = 1:size(X,2)
       for k = 1:size(mu,3)
            decision_grid(i,j,k) = [X(i,j)-mu(1,1,k) Y(i,j)-mu(1,2,k)]*[X(i,j)-mu(1,1,k) Y(i,j)-mu(1,2,k)]';
       end
   end
end
end