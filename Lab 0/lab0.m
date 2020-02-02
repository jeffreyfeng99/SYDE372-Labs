% SYDE Lab 0 - Matlab Introduction
% Name: Jeffrey Feng Date: Jan 16, 2020

clear all % clear all variables from memory
close all % close all open figures

% define the mean and variance of the pdf
mu = [5 0]'; % the mean of the pdf
sigma = [1 0.5;0.5 1]; % the variance matrix of the pdf

% define the coordinates of which to calculate the pdf
dx = 0.1; % step-size; lower to smoothen (increase sampling rate)
x1 = [mu(1)-sqrt(sigma(1,1))-2:dx:mu(1)+sqrt(sigma(1,1))+2]; % range of the random variable x1
x2 = [mu(2)-sqrt(sigma(2,2))-2:dx:mu(2)+sqrt(sigma(2,2))+2]; % range of the random variable x2

% Calculate the pdf, calling the function we created
y = Gauss2d(x1,x2,mu,sigma);
 
% Show a 3-D plot of the pdf
figure
subplot(2,1,1);
surf(x1,x2,y);
xlabel('x_1');
ylabel('x_2');

% Show contours of the pdf
subplot(2,1,2);
contour(x1,x2,y);
xlabel('x_{1}');
ylabel('x_{2}');
axis equal

% Show a colour map of the pdf
figure
imagesc(x1,x2,y)
xlabel('x_{1}');
ylabel('x_{2}');

% Plot region where pdf is greater than threshold
% Add mean of the pdf to the plot
z = (y>0.1);
figure
imagesc(x1,x2,z)
colormap(cool)
hold on % allow us to plot more on the same figure
plot(mu(1,1),mu(2,1),'gx'); % plot the mean
xlabel('x_{1}');
ylabel('x_{2}');