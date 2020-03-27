%
% parametric_gaussian(data)
%
% This function estimates the lambda parameter under the assumption that
% the given dataset is of exponential distribution.
%
% Parameters 
% data: (nx2 matrix) dataset
%
% Returns
% mean_hat: estimated mean for the assumed Gaussian distribution
% var_hat: estimated variance for the assumed Gaussian distribution
%

function [mean_hat, var_hat] = parametric_gaussian(data)

n_data = size(data, 2);
mean_hat = sum(data, 2)/n_data;
var_hat = (data * data')/n_data - (mean_hat * mean_hat');

end