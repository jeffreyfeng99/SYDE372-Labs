clear all;
close all;

class_defn;

seed = 5;
rng(seed) % To maintain consistent prototyping - remove for actual evaluations

data_A = generate_bivariate_cluster(n_A,mu_A,covar_A);
data_B = generate_bivariate_cluster(n_B,mu_B,covar_B);
data_C = generate_bivariate_cluster(n_C,mu_C,covar_C);
data_D = generate_bivariate_cluster(n_D,mu_D,covar_D);
data_E = generate_bivariate_cluster(n_E,mu_E,covar_E);

step_size = 0.25; % sampling rate - lower for higher resolution
case1_x = [min(min(data_A(:,1)),min(data_B(:,1))):step_size:max(max(data_A(:,1)),max(data_B(:,1)))];
case1_y = [min(min(data_A(:,2)),min(data_B(:,2))):step_size:max(max(data_A(:,2)),max(data_B(:,2)))];
[case1_X,case1_Y] = meshgrid(case1_x,case1_y);

case2_x = [min([min(data_C(:,1)),min(data_D(:,1)),min(data_E(:,1))]):step_size:max([max(data_C(:,1)),max(data_D(:,1)),max(data_E(:,1))])];
case2_y = [min([min(data_C(:,2)),min(data_D(:,2)),min(data_E(:,2))]):step_size:max([max(data_C(:,2)),max(data_D(:,2)),max(data_E(:,2))])];
[case2_X,case2_Y] = meshgrid(case2_x,case2_y);

case1_MED = MED(mu_A,mu_B,case1_X, case1_Y);
case1_MED = case1_MED >= 0;

case1_GED = GED(mu_A,mu_B,covar_A,covar_B,case1_X, case1_Y);
case1_GED = case1_GED >= 0;

case2_MED_CD = MED(mu_C,mu_D,case2_X,case2_Y);
case2_MED_CE = MED(mu_C,mu_E,case2_X,case2_Y);
case2_MED_DE = MED(mu_D,mu_E,case2_X,case2_Y);
case2_MED = zeros(size(case2_MED_CD));

case2_GED_CD = GED(mu_C,mu_D,covar_C,covar_D,case2_X,case2_Y);
case2_GED_CE = GED(mu_C,mu_E,covar_C,covar_E,case2_X,case2_Y);
case2_GED_DE = GED(mu_D,mu_E,covar_D,covar_E,case2_X,case2_Y);
case2_GED = zeros(size(case2_GED_CD));

for i = 1:size(case2_MED_CD,1)
    for j = 1:size(case2_MED_CD,2)
    if case2_MED_CD(i,j) < 0 && case2_MED_CE(i,j) < 0
        case2_MED(i,j) = 1;
    elseif case2_MED_CD(i,j) >= 0 && case2_MED_DE(i,j) < 0
        case2_MED(i,j) = 2;
    elseif case2_MED_CE(i,j) >= 0 && case2_MED_DE(i,j) >= 0
        case2_MED(i,j) = 3;    
    end
    end
end

for i = 1:size(case2_GED_CD,1)
    for j = 1:size(case2_GED_CD,2)
    if case2_GED_CD(i,j) < 0 && case2_GED_CE(i,j) < 0
        case2_GED(i,j) = 1;
    elseif case2_GED_CD(i,j) >= 0 && case2_GED_DE(i,j) < 0
        case2_GED(i,j) = 2;
    elseif case2_GED_CE(i,j) >= 0 && case2_GED_DE(i,j) >= 0
        case2_GED(i,j) = 3;    
    end
    end
end

% Remove the code below this (this is just for current testing purposes)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
hold on
contour(case1_X,case1_Y,case1_GED,[0.5,0.5]);
contour(case1_X,case1_Y,case1_MED,[0.5,0.5]);
plot_ellipse(mu_A(1),mu_A(2),theta_A,sqrt(eval_A(1,1)),sqrt(eval_A(2,2)));
plot_ellipse(mu_B(1),mu_B(2),theta_B,sqrt(eval_B(1,1)),sqrt(eval_B(2,2)));
scatter(data_A(:,1), data_A(:,2))
scatter(data_B(:,1), data_B(:,2))
hold off
axis equal

figure
hold on
contour(case2_X,case2_Y,case2_GED, [1.5,2.5],'b');
contour(case2_X,case2_Y,case2_MED, [1.5,2.5],'m');
plot_ellipse(mu_C(1),mu_C(2),theta_C,sqrt(eval_C(1,1)),sqrt(eval_C(2,2)));
plot_ellipse(mu_D(1),mu_D(2),theta_D,sqrt(eval_D(1,1)),sqrt(eval_D(2,2)));
plot_ellipse(mu_E(1),mu_E(2),theta_E,sqrt(eval_E(1,1)),sqrt(eval_E(2,2)));
scatter(data_C(:,1), data_C(:,2))
scatter(data_D(:,1), data_D(:,2))
scatter(data_E(:,1), data_E(:,2))
hold off
axis equal