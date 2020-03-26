
% Parzen - compute 1d density estimates
%
% [p,x] = parzen_1d( data, res, sigma, h )    
%
%  data - two-column matrix of (x,y) points
%         (third row/col optional point frequency)
%  res  - resolution (step size)
%         optionally [res lowx highx]
%  sigma- standard deviation of gaussian window
%  h    - scaling
%
%  x    - locations along x-axis
%  p    - estimated 2D PDF
%

function [p,x] = parzen_1d(data, res, sigma, h)
% sigma is the standard dev of the Gaussian window

if (size(data,2)>size(data,1)), data = data'; end;
numpts = size(data,1);

dl = min(data(:,1));
dh = max(data(:,1));
if length(res)>1, dl = res(2); dh = res(3); res = res(1); end;

if (max(dh-dl)/res>1000), 
  error('Excessive data range relative to resolution.');
end;

x = [dl:res:dh]';
p = zeros(length(x),1);  

for i=1:length(x),
  p(i) = 1/numpts * sum(1/h*normpdf((x(i)-data)/h,0,sigma));
end;

end