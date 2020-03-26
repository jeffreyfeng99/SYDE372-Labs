%
% sequential_discriminant_classifier(G, N_aB, N_bA, x)
%
% This function classifies a dataset based on the given discriminants and
% their corresponding array containing their mistakes.
%
% Parameters 
% G: (3,j) array, where each column is a discriminant vector; together,
% they form a sequential discriminant classifier
% N_aB: (j,1) array, where each value is the number of times that G of the
% corresponding index classifies a sample in class A as class B
% N_bA: (j,1) array, where each value is the number of times that G of the
% corresponding index classifies a sample in class B as class A
% x: dataset to be classified
%

function [class_arr] = sequential_discriminant_classifier(G, N_aB, N_bA, x)

x = [ones(size(x,1),1) x];
class_arr = zeros(size(x,1),1);

for j=1:size(G,2)
    % If Gj classifies x as class B and naB,j = 0 then \Say Class B"
    % If Gj classifies x as class A and nbA,j = 0 then \Say Class A"
    classified = x*G(:,j);
    
    for i=1:size(classified,1)
        if class_arr(i) == 0
            if classified(i) > 0 && N_aB(j) == 0
                class_arr(i) = 2;
            elseif classified(i) < 0 && N_bA(j) == 0
                class_arr(i) = 1;
            end
        end
    end
end
class_arr = class_arr-1;
end