%% Gaussian a
sampling_array = [min(data_1a(1,:)):step_size:max(data_1a(1,:))+1];
p_a_hat_gaussian = normpdf(sampling_array,m_hat_a,var_hat_a);
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on
title('Gaussian parametric estimation for data set a');
xlabel('x'); ylabel('p(x)')  

plot(sampling_array,p_a)
plot(sampling_array,p_a_hat_gaussian)

gaussian_lg = legend('True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
title(gaussian_lg, 'Legend')

%% Gaussian b
sampling_array = [min(data_1b(1,:)):step_size:max(data_1b(1,:))+1];
p_b_hat_gaussian = normpdf(sampling_array,m_hat_b,var_hat_b);
p_b = exppdf(sampling_array,lambda_1b);

figure
hold on
title('Gaussian parametric estimation for data set b');
xlabel('x'); ylabel('p(x)')  

plot(sampling_array,p_b)
plot(sampling_array,p_b_hat_gaussian)

gaussian_lg = legend('True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
title(gaussian_lg, 'Legend')

%% Exponential a
sampling_array = [min(data_1a(1,:)):step_size:max(data_1a(1,:))+1];
p_a_hat_exp = exppdf(sampling_array,1/lambda_hat_a);
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on
title('Exponential parametric estimation for data set a');
xlabel('x'); ylabel('p(x)')  

plot(sampling_array,p_a)
plot(sampling_array,p_a_hat_exp)

gaussian_lg = legend('True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
title(gaussian_lg, 'Legend')

%% Exponential b
sampling_array = [min(data_1b(1,:)):step_size:max(data_1b(1,:))+1];
p_b_hat_exp = exppdf(sampling_array,1/lambda_hat_b);
p_b = exppdf(sampling_array,1/lambda_1b);

figure
hold on
title('Exponential parametric estimation for data set b');
xlabel('x'); ylabel('p(x)')  
plot(sampling_array,p_b)
plot(sampling_array,p_b_hat_exp)

gaussian_lg = legend('True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
title(gaussian_lg, 'Legend')

%% Uniform a
sampling_array = [lower_a-1:step_size:upper_a+1];
p_a_hat_uni = unifpdf(sampling_array,lower_a,upper_a);
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on

title('Uniform parametric estimation for data set a');
xlabel('x'); ylabel('p(x)')  

plot(sampling_array,p_a)
plot(sampling_array,p_a_hat_uni)

gaussian_lg = legend('True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
title(gaussian_lg, 'Legend')

%% Uniform b
sampling_array = [lower_b-1:step_size:upper_b+1];
p_b_hat_uni = unifpdf(sampling_array,lower_b,upper_b);
p_b = exppdf(sampling_array,1/lambda_1b);

figure
hold on

title('Uniform parametric estimation for data set b');
xlabel('x'); ylabel('p(x)')  

plot(sampling_array,p_b)
plot(sampling_array,p_b_hat_uni)

gaussian_lg = legend('True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
title(gaussian_lg, 'Legend')

%% Parzen (0.1) a
sampling_array = [min(data_1a(1,:)):step_size:max(data_1a(1,:))+1];
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on
title('Non-parametric estimation for data set a (Parzen Gaussian window with st. dev of 0.1)');
xlabel('x'); ylabel('p(x)')  

plot(sampling_array,p_a)
plot(x_a1, parz_a1)

gaussian_lg = legend('True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
title(gaussian_lg, 'Legend')
%% Parzen (0.1) b
sampling_array = [min(data_1b(1,:)):step_size:max(data_1b(1,:))+1];
p_b = exppdf(sampling_array,1/lambda_1b);

figure
hold on
title('Non-parametric estimation for data set b (Parzen Gaussian window with st. dev of 0.1)');
xlabel('x'); ylabel('p(x)')  

plot(sampling_array,p_b)
plot(x_b1,parz_b1)

gaussian_lg = legend('True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
title(gaussian_lg, 'Legend')
%% Parzen (0.4) a
sampling_array = [min(data_1a(1,:)):step_size:max(data_1a(1,:))+1];
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on
title('Non-parametric estimation for data set a (Parzen Gaussian window with st. dev of 0.4)');
xlabel('x'); ylabel('p(x)')  

plot(sampling_array,p_a)
plot(x_a2, parz_a2)

gaussian_lg = legend('True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
title(gaussian_lg, 'Legend')
%% Parzen (0.4) b
sampling_array = [min(data_1b(1,:)):step_size:max(data_1b(1,:))+1];
p_b = exppdf(sampling_array,1/lambda_1b);

figure
hold on
title('Non-parametric estimation for data set b (Parzen Gaussian window with st. dev of 0.4)');
xlabel('x'); ylabel('p(x)')  

plot(sampling_array,p_b)
plot(x_b2,parz_b2)

gaussian_lg = legend('True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
title(gaussian_lg, 'Legend')
