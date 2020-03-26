function [mean_hat, var_hat] = parametric_gaussian(data)

n_data = size(data, 2);
mean_hat = sum(data, 2)/n_data;
var_hat = (data * data')/n_data - (mean_hat * mean_hat');

end