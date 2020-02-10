% Redefine the classifier grids as the data sets to use for error analysis

% Create test sets for the kNN cases
test_A_NN = generate_bivariate_cluster(n_A,mu_A,covar_A);
test_B_NN = generate_bivariate_cluster(n_B,mu_B,covar_B);
test_C_NN = generate_bivariate_cluster(n_C,mu_C,covar_C);
test_D_NN = generate_bivariate_cluster(n_D,mu_D,covar_D);
test_E_NN = generate_bivariate_cluster(n_E,mu_E,covar_E);

% Grid of points is comprised of the data points themselves
case1_X_error = [data_A(:,1); data_B(:,1)];
case1_Y_error = [data_A(:,2); data_B(:,2)];

case1_MED_error = MED_V2(c1_mu,case1_X_error,case1_Y_error);
case1_MED_error = classify_data_V2(case1_MED_error);

case1_GED_error = GED_V2(c1_mu,cat(3,covar_A,covar_B),case1_X_error,case1_Y_error);
case1_GED_error = classify_data_V2(case1_GED_error);

case1_MAP_error = MAP_V2(cat(3,mu_A,mu_B),cat(3,covar_A,covar_B),[n_A n_B],case1_X_error,case1_Y_error);
case1_MAP_error = classify_data_V2(case1_MAP_error, true);

case1_NN_X_error = [test_A_NN(:,1); test_B_NN(:,1)];
case1_NN_Y_error = [test_A_NN(:,2); test_B_NN(:,2)];

case1_NN_error = kNN_V2({data_A,data_B},case1_NN_X_error,case1_NN_Y_error,1);
case1_NN_error = classify_data_V2(case1_NN_error);

case1_5NN_error = kNN_V2({data_A,data_B},case1_NN_X_error,case1_NN_Y_error,5);
case1_5NN_error = classify_data_V2(case1_5NN_error);

case2_X_error = [data_C(:,1); data_D(:,1); data_E(:,1)];
case2_Y_error = [data_C(:,2); data_D(:,2); data_E(:,2)];

case2_MED_error = MED_V2(cat(3,mu_C,mu_D,mu_E),case2_X_error,case2_Y_error);
case2_MED_error = classify_data_V2(case2_MED_error);

case2_GED_error = GED_V2(cat(3,mu_C,mu_D,mu_E),cat(3,covar_C,covar_D,covar_E),case2_X_error,case2_Y_error);
case2_GED_error = classify_data_V2(case2_GED_error);

case2_MAP_error = MAP_V2(cat(3,mu_C,mu_D,mu_E),cat(3,covar_C,covar_D,covar_E),[n_C n_D n_E],case2_X_error,case2_Y_error);
case2_MAP_error = classify_data_V2(case2_MAP_error, true);

case2_NN_X_error = [test_C_NN(:,1); test_D_NN(:,1); test_E_NN(:,1)];
case2_NN_Y_error = [test_C_NN(:,2); test_D_NN(:,2); test_E_NN(:,1)];

case2_NN_error = kNN_V2({data_C,data_D,data_E},case2_NN_X_error,case2_NN_Y_error,1);
case2_NN_error = classify_data_V2(case2_NN_error);

case2_5NN_error = kNN_V2({data_C,data_D,data_E},case2_NN_X_error,case2_NN_Y_error,5);
case2_5NN_error = classify_data_V2(case2_5NN_error);
