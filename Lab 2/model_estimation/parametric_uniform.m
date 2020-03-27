%
% parametric_uniform(data)
%
% This function estimates the lambda parameter under the assumption that
% the given dataset is of exponential distribution.
%
% Parameters 
% data: (nx2 matrix) dataset
%
% Returns
% lower_bound: estimated lower bound for the assumed Uniform distribution
% upper_bound: estimated upper bound for the assumed Uniform distribution
%

function [lower_bound, upper_bound] = parametric_uniform(data)

lower_bound = min(data);
upper_bound = max(data);

end