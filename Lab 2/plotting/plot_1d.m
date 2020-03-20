%% Gaussian a
sampling_array = [min(data_1a(1,:)):step_size:max(data_1a(1,:))+1];
p_a_hat_gaussian = normpdf(sampling_array,m_hat_a,var_hat_a);
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
plot(sampling_array,p_a)
hold on
plot(sampling_array,p_a_hat_gaussian)

%% Gaussian b
sampling_array = [min(data_1b(1,:)):step_size:max(data_1b(1,:))+1];
p_b_hat_gaussian = normpdf(sampling_array,m_hat_b,var_hat_b);
p_b = exppdf(sampling_array,lambda_1b);

figure
plot(sampling_array,p_b)
hold on
plot(sampling_array,p_b_hat_gaussian)

%% Exponential a
sampling_array = [min(data_1a(1,:)):step_size:max(data_1a(1,:))+1];
p_a_hat_exp = exppdf(sampling_array,1/lambda_hat_a);
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
plot(sampling_array,p_a)
hold on
plot(sampling_array,p_a_hat_exp)

%% Exponential b
sampling_array = [min(data_1b(1,:)):step_size:max(data_1b(1,:))+1];
p_b_hat_exp = exppdf(sampling_array,1/lambda_hat_b);
p_b = exppdf(sampling_array,1/lambda_1b);

figure
plot(sampling_array,p_b)
hold on
plot(sampling_array,p_b_hat_exp)

%% Uniform a
sampling_array = [lower_a-1:step_size:upper_a+1];
p_a_hat_uni = unifpdf(sampling_array,lower_a,upper_a);
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
plot(sampling_array,p_a)
hold on
plot(sampling_array,p_a_hat_uni)

%% Uniform b
sampling_array = [lower_b-1:step_size:upper_b+1];
p_b_hat_uni = unifpdf(sampling_array,lower_b,upper_b);
p_b = exppdf(sampling_array,1/lambda_1b);

figure
plot(sampling_array,p_b)
hold on
plot(sampling_array,p_b_hat_uni)

%% Parzen a
sampling_array = [min(data_1a(1,:)):step_size:max(data_1a(1,:))+1];
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
plot(sampling_array,p_a)
hold on
plot(x_a, parz_a)

%% Parzen b
sampling_array = [min(data_1b(1,:)):step_size:max(data_1b(1,:))+1];
p_b = exppdf(sampling_array,1/lambda_1b);

figure
plot(sampling_array,p_b)
hold on
plot(x_b,parz_b)
