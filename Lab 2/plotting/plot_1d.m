%% Gaussian a
sampling_array = [min(data_1a(1,:))-2:step_size_plot:max(data_1a(1,:))+2];
p_a_hat_gaussian = normpdf(sampling_array,m_hat_a,var_hat_a);
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on
title('Gaussian parametric estimation for data set a');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1a(1,:))-2 max(data_1a(1,:))+2])

scatter(data_1a,zeros(1,length(data_1a)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_a,'r')
plot(sampling_array,p_a_hat_gaussian,'b')

gaussian_1d_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.5 0.75]);
title(gaussian_1d_lg, 'Legend')

%% Gaussian b
sampling_array = [min(data_1b(1,:))-2:step_size_plot:max(data_1b(1,:))+2];
p_b_hat_gaussian = normpdf(sampling_array,m_hat_b,var_hat_b);
p_b = exppdf(sampling_array,lambda_1b);

figure
hold on
title('Gaussian parametric estimation for data set b');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1b(1,:))-2 max(data_1b(1,:))+2])

scatter(data_1b,zeros(1,length(data_1b)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_b,'r')
plot(sampling_array,p_b_hat_gaussian,'b')

gaussian_1d_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(gaussian_1d_lg, 'Legend')

%% Exponential a
%sampling_array = [min(data_1a(1,:))-2:step_size_plot:max(data_1a(1,:))+2];
sampling_array = [-1:step_size_plot:max(data_1a(1,:))+2];
p_a_hat_exp = exppdf(sampling_array,1/lambda_hat_a);
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on
title('Exponential parametric estimation for data set a');
xlabel('x'); ylabel('p(x)')  
%xlim([min(data_1a(1,:))-2 max(data_1a(1,:))+2])
xlim([-1 max(data_1a(1,:))+2])

scatter(data_1a,zeros(1,length(data_1a)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_a,'r')
plot(sampling_array,p_a_hat_exp,'b')

exp_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.5 0.75]);
title(exp_lg, 'Legend')

%% Exponential b
sampling_array = [min(data_1b(1,:))-2:step_size_plot:max(data_1b(1,:))+2];
p_b_hat_exp = exppdf(sampling_array,1/lambda_hat_b);
p_b = exppdf(sampling_array,1/lambda_1b);

figure
hold on
title('Exponential parametric estimation for data set b');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1b(1,:))-2 max(data_1b(1,:))+2])

scatter(data_1b,zeros(1,length(data_1b)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_b,'r')
plot(sampling_array,p_b_hat_exp,'b')

exp_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(exp_lg, 'Legend')

%% Uniform a
sampling_array = [lower_a-2:step_size_plot:upper_a+2];
p_a_hat_uni = unifpdf(sampling_array,lower_a,upper_a);
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on

title('Uniform parametric estimation for data set a');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1a(1,:))-2 max(data_1a(1,:))+2])

scatter(data_1a,zeros(1,length(data_1a)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_a,'r')
plot(sampling_array,p_a_hat_uni,'b')

uni_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.5 0.75]);
title(uni_lg, 'Legend')

%% Uniform b
sampling_array = [lower_b-2:step_size_plot:upper_b+2];
p_b_hat_uni = unifpdf(sampling_array,lower_b,upper_b);
p_b = exppdf(sampling_array,1/lambda_1b);

figure
hold on

title('Uniform parametric estimation for data set b');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1b(1,:))-2 max(data_1b(1,:))+2])

scatter(data_1b,zeros(1,length(data_1b)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_b,'r')
plot(sampling_array,p_b_hat_uni,'b')

uni_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(uni_lg, 'Legend')

%% Parzen a (st. dev 0.1)
sampling_array = [min(data_1a(1,:))-2:step_size_plot:max(data_1a(1,:))+2];
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on
title('Non-parametric estimation for data set a (Parzen Gaussian window with st. dev of 0.1)');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1a(1,:))-2 max(data_1a(1,:))+2])

scatter(data_1a,zeros(1,length(data_1a)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_a,'r')
plot(x_a1, parz_a1,'b')

parz_1d_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.5 0.75]);
title(parz_1d_lg, 'Legend')
%% Parzen b (st. dev 0.1) 
sampling_array = [min(data_1b(1,:))-2:step_size_plot:max(data_1b(1,:))+2];
p_b = exppdf(sampling_array,1/lambda_1b);

figure
hold on
title('Non-parametric estimation for data set b (Parzen Gaussian window with st. dev of 0.1)');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1b(1,:))-2 max(data_1b(1,:))+2])

scatter(data_1b,zeros(1,length(data_1b)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_b,'r')
plot(x_b1,parz_b1,'b')

parz_1d_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(parz_1d_lg, 'Legend')
%% Parzen a (st. dev 0.4)
sampling_array = [min(data_1a(1,:))-2:step_size_plot:max(data_1a(1,:))+2];
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on
title('Non-parametric estimation for data set a (Parzen Gaussian window with st. dev of 0.4)');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1a(1,:))-2 max(data_1a(1,:))+2])

scatter(data_1a,zeros(1,length(data_1a)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_a,'r')
plot(x_a2, parz_a2,'b')

parz_1d_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.5 0.75]);
title(parz_1d_lg, 'Legend')
%% Parzen b (st. dev 0.4)
sampling_array = [min(data_1b(1,:))-2:step_size_plot:max(data_1b(1,:))+2];
p_b = exppdf(sampling_array,1/lambda_1b);

figure
hold on
title('Non-parametric estimation for data set b (Parzen Gaussian window with st. dev of 0.4)');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1b(1,:))-2 max(data_1b(1,:))+2])

scatter(data_1b,zeros(1,length(data_1b)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_b,'r')
plot(x_b2,parz_b2,'b')

parz_1d_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(parz_1d_lg, 'Legend')

%% Parzen a (0.1 st. dev and scaling factor)
sampling_array = [min(data_1a(1,:))-2:step_size_plot:max(data_1a(1,:))+2];
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on
title('Non-parametric estimation for data set a (Parzen Gaussian window with st. dev of 0.1 and scaling factor)');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1a(1,:))-2 max(data_1a(1,:))+2])

scatter(data_1a,zeros(1,length(data_1a)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_a,'r')
plot(x_a1h, parz_a1h,'b')

parz_1d_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.5 0.75]);
title(parz_1d_lg, 'Legend')
%% Parzen b (0.1 st. dev and scaling factor)
sampling_array = [min(data_1b(1,:))-2:step_size_plot:max(data_1b(1,:))+2];
p_b = exppdf(sampling_array,1/lambda_1b);

figure
hold on
title('Non-parametric estimation for data set b (Parzen Gaussian window with st. dev of 0.1 and scaling factor)');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1b(1,:))-2 max(data_1b(1,:))+2])

scatter(data_1b,zeros(1,length(data_1b)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_b,'r')
plot(x_b1h,parz_b1h,'b')

parz_1d_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(parz_1d_lg, 'Legend')


%% Parzen a (0.4 st. dev and scaling factor) 
sampling_array = [min(data_1a(1,:))-2:step_size_plot:max(data_1a(1,:))+2];
p_a = normpdf(sampling_array,mu_1a,var_1a);

figure
hold on
title('Non-parametric estimation for data set a (Parzen Gaussian window with st. dev of 0.4 and scaling factor)');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1a(1,:))-2 max(data_1a(1,:))+2])

scatter(data_1a,zeros(1,length(data_1a)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_a,'r')
plot(x_a2h, parz_a2h,'b')

parz_1d_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 0.5 0.75]);
title(parz_1d_lg, 'Legend')
%% Parzen b (0.4 st. dev and scaling factor)
sampling_array = [min(data_1b(1,:))-2:step_size_plot:max(data_1b(1,:))+2];
p_b = exppdf(sampling_array,1/lambda_1b);

figure
hold on
title('Non-parametric estimation for data set b (Parzen Gaussian window with st. dev of 0.4 and scaling factor)');
xlabel('x'); ylabel('p(x)')  
xlim([min(data_1b(1,:))-2 max(data_1b(1,:))+2])

scatter(data_1b,zeros(1,length(data_1b)),10,'o','MarkerEdgeColor', '#77AC30');
plot(sampling_array,p_b,'r')
plot(x_b2h,parz_b2h,'b')

parz_1d_lg = legend('Sample density','True distribution', 'Estimated distribution', ...
                 'Location', 'northeast');
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.5 0 0.5 0.75]);
title(parz_1d_lg, 'Legend')
