% Load data for Section 1
sect1_data = load('lab2_1.mat');
data_1a = sect1_data.a;
data_1b = sect1_data.b;

mu_1a = 5;
var_1a = 1;
lambda_1b = 1;

% Load data for Section 2
sect2_data = load('lab2_2.mat');
% Training data
data_2al = sect2_data.al;
data_2bl = sect2_data.bl;
data_2cl = sect2_data.cl;
% Testing data
data_2at = sect2_data.at;
data_2bt = sect2_data.bt;
data_2ct = sect2_data.ct;

% Load data for Section 3
sect3_data = load('lab2_3.mat');
data_3a = sect3_data.a;
data_3b = sect3_data.b;