clear all;
close all;

addpath('./datasets','./plotting');

% Sampling rate
step_size = 0.5;

load_data;

%% Model Estimation 1-D
[m_hat_a,var_hat_a] = parametric_gaussian(data_1a);
[m_hat_b,var_hat_b] = parametric_gaussian(data_1b);

lambda_hat_a = parametric_exponential(data_1a);
lambda_hat_b = parametric_exponential(data_1b);

[lower_a,upper_a] = parametric_uniform(data_1a);
[lower_b,upper_b] = parametric_uniform(data_1b);

[parz_a, x_a] = parzen_1d(data_1a,[0.01]);
[parz_b, x_b] = parzen_1d(data_1b,[0.01]);

plot_1d;

%% Model Estimation 2-D Parametric
x = [min([min(data_2al(:,1)),min(data_2bl(:,1)),min(data_2cl(:,1))]):step_size:max([max(data_2al(:,1)),max(data_2bl(:,1)),max(data_2cl(:,1))])+1];
y = [min([min(data_2al(:,2)),min(data_2bl(:,2)),min(data_2cl(:,2))]):step_size:max([max(data_2al(:,2)),max(data_2bl(:,2)),max(data_2cl(:,2))])+1];
[X,Y] = meshgrid(x,y);

[m_hat_a_2, cov_hat_a] = parametric_gaussian(data_2al');
[m_hat_b_2, cov_hat_b] = parametric_gaussian(data_2bl');
[m_hat_c_2, cov_hat_c] = parametric_gaussian(data_2cl');

mus = cat(3,m_hat_a_2,m_hat_b_2,m_hat_c_2);
covs = cat(3,cov_hat_a,cov_hat_b,cov_hat_c);

ML_result = ML_Gaussian(mus,covs,X,Y);

%% Model Estimation 2-D Non Parametric

low_x = min([min(data_2al(:,1)),min(data_2bl(:,1)),min(data_2cl(:,1))]);
high_x = max([max(data_2al(:,1)),max(data_2bl(:,1)),max(data_2cl(:,1))])+1;
low_y = min([min(data_2al(:,2)),min(data_2bl(:,2)),min(data_2cl(:,2))]);
high_y = max([max(data_2al(:,2)),max(data_2bl(:,2)),max(data_2cl(:,2))])+1;
res = [step_size low_x low_y high_x high_y];


%%% create gaussian windown "win" here

[parz_a_2, x_a_2, y_a_2] = parzen_2d(data_2al,res);
[parz_b_2, x_b_2, y_b_2] = parzen_2d(data_2bl,res);
[parz_c_2, x_c_2, y_c_2] = parzen_2d(data_2cl,res);

parzs = cat(3,parz_a_2,parz_b_2,parz_c_2);
parz_decision = classify_data(parzs, true);

plot_2d;