function lambda_hat = parametric_exponential(data)

n_data = size(data, 2);
sample_mean = sum(data, 2)/n_data;
lambda_hat = 1/sample_mean;

end