function class_map = classify_data(dist_1, dist_2, dist_3)

if nargin < 2
    class_map = dist_1 < 0;
else
    class_map = zeros(size(dist_1));
    
    for i = 1:size(dist_1,1)
        for j = 1:size(dist_1,2)
            if dist_1(i,j) < 0 && dist_2(i,j) < 0
                class_map(i,j) = 0;
            elseif dist_1(i,j) >= 0 && dist_3(i,j) < 0
                class_map(i,j) = 1;
            elseif dist_2(i,j) >= 0 && dist_3(i,j) >= 0
                class_map(i,j) = 2;    
            end
        end
    end
end

end