clear all;
close all;

addpath('./datasets','./plotting');

% Sampling rate
step_size = 0.1;

load_data;

[m_hat_a,var_hat_a] = parametric_gaussian(data_1a);
[m_hat_b,var_hat_b] = parametric_gaussian(data_1b);

lambda_hat_a = parametric_exponential(data_1a);
lambda_hat_b = parametric_exponential(data_1b);

[lower_a,upper_a] = parametric_uniform(data_1a);
[lower_b,upper_b] = parametric_uniform(data_1b);

plot_1d;
