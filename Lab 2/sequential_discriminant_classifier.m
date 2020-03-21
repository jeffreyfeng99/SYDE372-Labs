function [class_arr] = sequential_discriminant_classifier(G, N_aB, N_bA, x)

x = [ones(length(x),1) x];
class_arr = zeros(length(x),1);

for j=1:size(G,2)
    % If Gj classifies x as class B and naB,j = 0 then \Say Class B"
    % If Gj classifies x as class A and nbA,j = 0 then \Say Class A"
    classified = x*G(:,j);
    
    for i=1:size(classified,1)
        if class_arr(i) == 0
            if classified(i) > 0 && N_aB(j) == 0
                class_arr(i) = 2;
            elseif classified(i) < 0 && N_bA(j) == 0
                class_arr(i) = 3;
            end
        end
    end
%     class_B = -((classified > 0) & ~(N_aB(j) | 0));
%     class_A = (classified < 0) & ~(N_bA(j) | 0);
%     
%     class_arr = class_arr + class_A + class_B;

    
%     if N_bA(j) == 0
%         class_arr = (classified < 0) ;
%     end

end
class_arr = class_arr-2;
end