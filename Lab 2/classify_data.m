%
% classify_data(decision_grid, MAP)
%
% This function returns a 2D matrix representing coordinate points
% on the XY plane. The input is a 3D matrix of distances (or likelihood 
% probabilities in the case of ML), in which the third axis 
% corresponds to the varying classes. MED, GED, and kNN selects the class 
% by indexing according to minumum distance along the third axis. ML 
% chooses based on indexing according to maximum posterior along the third
% axis. The respective value of each element in the output matrix
% is the determined class of data point at that location.  
%
% decision_grid: 3D matrix (x by y by n), where x and y are the 
%                 coordinate axes, and n is the number of classes
% MAP: If true, select the maximum indices according to MAP decision rule
%

function class_map = classify_data(decision_grid, ML_)

% MAP parameter does not exist, so default it to false
if ~exist('ML_','var')
  ML_ = false;
end

if ML_ == false
    [~,class_map] = min(decision_grid,[],3);
    class_map = class_map - 1;
else
    [~,class_map] = max(decision_grid,[],3);
    class_map = class_map - 1;
end

end