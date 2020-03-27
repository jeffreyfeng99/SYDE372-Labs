%
% parametric_exponential(data)
%
% This function estimates the lambda parameter under the assumption that
% the given dataset is of exponential distribution.
%
% Parameters 
% data: (nx2 matrix) dataset
%
% Returns
% lambda_hat: estimated parameter for the assumed exponential distribution

function lambda_hat = parametric_exponential(data)

n_data = size(data, 2);
sample_mean = sum(data, 2)/n_data;
lambda_hat = 1/sample_mean;

end