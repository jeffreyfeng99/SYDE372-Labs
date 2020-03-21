function [G, N_aB, N_bA] = MED_sequential_discriminant(data_A, data_B)
%     rng(5);
%     rng(1);
%     current = RandStream.Seed;
rng(4);
    data_a = [ones(length(data_A),1) data_A];
    data_b = [ones(length(data_B),1) data_B];
    
    j = 1;
    G = zeros(j,3);
    N_aB = zeros(j,1);
    N_bA = zeros(j,1);
    
    while (size(data_a,1) > 0 && size(data_b,1) > 0)
%         a = 
%         la = length(data_a)
%         lb = length(data_b)
%         rand_a = randi([1 size(data_a,1)])
%         rand_b = randi([1 size(data_b,1)])
        prototype_a = data_a(rand_a,:);
        prototype_b = data_b(rand_b,:);
        
        w = (prototype_b(2:3) - prototype_a(2:3));
        g = [0.5*(prototype_a(2:3)*prototype_a(2:3)' - prototype_b(2:3)*prototype_b(2:3)') w]';
        
        n_aB = data_a*g; % rename later
        n_bA = data_b*g;
               
        aB = find(n_aB>0);
        bA = find(n_bA<0);
        n_aB = length(aB);
        n_bA = length(bA);
        
        if n_aB ~= 0 && n_bA ~= 0, continue; end
        
%         G_temp = zeros(j,3);
%         N_aB_temp = zeros(j,1);
%         N_bA_temp = zeros(j,1);
        if j == 1 
            G = g;
            N_aB = n_aB;
            N_bA = n_bA;
        else
            G = [G g];  
            N_aB = [N_aB; n_aB];
            N_bA = [N_bA; n_bA];
                
%             G = G_temp;
%             N_aB = N_aB_temp;
%             N_bA = N_bA_temp;
        end
        
        j = j+1;
        
        if n_aB == 0, data_b = data_b(bA,:); end
        if n_bA == 0, data_a = data_a(aB,:); end

    end
end