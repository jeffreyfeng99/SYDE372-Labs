function decision_grid = kNN(data_1,data_2,X,Y,k) %data_1,data_2 are the sample points for 2 classes

decision_grid = zeros(size(X));

for i = 1:size(X,1)
   for j = 1:size(X,2)
       % get Class 1 Prototype
       distances_1 = zeros(size(data_1,1),1);
       % get distance between (X,Y) point and Class 2 sample point
       for a = 1:size(data_1,1)
           dist = norm([X(i,j) Y(i,j)] - data_1(a,:));
           distances_1(a) = dist;         
       end
       
       %sort distance array from shortest to longest 
       sorted_distances_1 = sort(distances_1);
       k_sum_1 = 0;
       
       %prototype calculation for Class 1
       for z = 1:k
           k_sum_1 = k_sum_1+sorted_distances_1(z);
       end
       
       k_mean_1 = k_sum_1/k;
             
       % get Class 2 Prototype
       distances_2 = zeros(size(data_2,1),1);
       % get distance between (X,Y) point and Class 2 sample point
       for a = 1:size(data_2,1)
           dist = norm([X(i,j) Y(i,j)]-data_2(a,:));
           distances_2(a) = dist;    
       end
       
       %sort distance array from shortest to longest 
       sorted_distances_2 = sort(distances_2);
       k_sum_2 = 0;
       
       %prototype calculation for Class 2
       for z = 1:k
           k_sum_2 = k_sum_2+sorted_distances_2(z);
       end
       
       k_mean_2 = k_sum_2/k;
       
       %decision grid is populated with difference of distances from point to each kNN prototype
       decision_grid(i,j) = [k_mean_1-k_mean_2]; 
   end
end
end