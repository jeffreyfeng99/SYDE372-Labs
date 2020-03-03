clear all;
close all;

% Sampling rate
step_size = 0.1;

load_data;

sect1_array_a = [min(data_a(1,:)):step_size:max(data_a(1,:))+1];
sect1_array_b = [min(data_b(1,:)):step_size:max(data_b(1,:))+1];

[m_a,v_a] = parametric_gaussian(data_a);
p_hat_a = normpdf(sect1_array_a,m_a,v_a);
p_a = normpdf(sect1_array_a,5,1);

[m_b,v_b] = parametric_gaussian(data_b);
p_hat_b = normpdf(sect1_array_b,m_b,v_b);
p_b = exppdf(sect1_array_b,1);

l_b = parametric_exponential(data_b);
p_hat_exp_b = exppdf(sect1_array_b,1/l_b);
p_exp_b = exppdf(sect1_array_b,1);

figure
plot(sect1_array_a,p_a)
hold on
plot(sect1_array_a,p_hat_a)

figure
plot(sect1_array_b,p_b)
hold on
plot(sect1_array_b,p_hat_b)

figure
plot(sect1_array_b,p_exp_b)
hold on
plot(sect1_array_b,p_hat_exp_b)