clear all;
close all;

addpath('./datasets','./plotting');

% Sampling rate
step_size_plot = 0.05
step_size = 0.5;

load_data;

%% Model Estimation 1-D
[m_hat_a,var_hat_a] = parametric_gaussian(data_1a);
[m_hat_b,var_hat_b] = parametric_gaussian(data_1b);

lambda_hat_a = parametric_exponential(data_1a);
lambda_hat_b = parametric_exponential(data_1b);

[lower_a,upper_a] = parametric_uniform(data_1a);
[lower_b,upper_b] = parametric_uniform(data_1b);

[parz_a1, x_a1] = parzen_1d(data_1a,[0.01 min(data_1a)-2 max(data_1a)+2],0.1);
[parz_b1, x_b1] = parzen_1d(data_1b,[0.01 min(data_1b)-2 max(data_1b)+2],0.1);

[parz_a2, x_a2] = parzen_1d(data_1a,[0.01 min(data_1a)-2 max(data_1a)+2],0.4);
[parz_b2, x_b2] = parzen_1d(data_1b,[0.01 min(data_1b)-2 max(data_1b)+2],0.4);

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

%%% create gaussian window "win" here
win_mu = [mean(x) mean(y)];
win_sigma = [400 0;0 400];
win = mvnpdf([X(:) Y(:)],win_mu,win_sigma);
win = reshape(win,[size(X,1),size(X,2)]);

[parz_a_2, x_a_2, y_a_2] = parzen_2d(data_2al,res,win);
[parz_b_2, x_b_2, y_b_2] = parzen_2d(data_2bl,res,win);
[parz_c_2, x_c_2, y_c_2] = parzen_2d(data_2cl,res,win);

parzs = cat(3,parz_a_2,parz_b_2,parz_c_2);
parz_decision = classify_data(parzs, true);

plot_2d;

%% Sequential Discriminants
x = [min([min(data_3a(:,1)),min(data_3b(:,1))]):step_size:max([max(data_3a(:,1)),max(data_3b(:,1))])+1];
y = [min([min(data_3a(:,2)),min(data_3b(:,2))]):step_size:max([max(data_3a(:,2)),max(data_3b(:,2))])+1];
[X,Y] = meshgrid(x,y);

[G, N_aB, N_bA] = MED_sequential_discriminant(data_3a,data_3b);

% Show individual discriminants
figure
hold on
scatter(data_3a(:,1),data_3a(:,2));
scatter(data_3b(:,1),data_3b(:,2));
for i=1:size(G,2)
f = @(x,y) G(1,i) + G(2,i)*x + G(3,i)*y;
fimplicit(f, [min(x),max(x)]);
end

% Show complete contour
grid = [X(:) Y(:)];
classes = sequential_discriminant_classifier(G,N_aB,N_bA,grid);
classes = reshape(classes,[size(X,1) size(X,2)]);
figure
hold on 
scatter(data_3a(:,1),data_3a(:,2));
scatter(data_3b(:,1),data_3b(:,2));
contour(X,Y,classes);

[class_A] = sequential_discriminant_classifier(G,N_aB,N_bA,data_3a);
[class_B] = sequential_discriminant_classifier(G,N_aB,N_bA,data_3b);