function class_map = classify_data_V2(decision_grid, MAP)
if ~exist('MAP','var')
 % MAP parameter does not exist, so default it to something
  MAP = false;
end

if MAP == false
    [~,class_map] = min(decision_grid,[],3);
    class_map = class_map - 1;
else
    [~,class_map] = max(decision_grid,[],3);
    class_map = class_map - 1;
end
end