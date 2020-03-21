
% Parzen - compute 1d density estimates
%
% [p,x,y] = parzen_1d( data, res, win )    
%
%  data - two-column matrix of (x,y) points
%         (third row/col optional point frequency)
%  res  - resolution (step size)
%         optionally [res lowx highx]
%  win  - optional, gives form of window 
%          if a scalar - radius of square window
%          if a vector - radially symmetric window
%          if a matrix - actual 2D window shape
%
%  x    - locations along x-axis
%  y    - locations along y-axis
%  p    - estimated 2D PDF
%

%
% P. Fieguth
% Nov. 1997
%

function [p,x] = parzen_1d(data, res, sigma)
% sigma is the standard dev of the Gaussian window

if (size(data,2)>size(data,1)), data = data'; end;
numpts = size(data,1);

dl = min(data(:,1));
dh = max(data(:,1));
if length(res)>1, dl = res(2); dh = res(3); res = res(1); end;

if (max(dh-dl)/res>1000), 
  error('Excessive data range relative to resolution.');
end;

x = [dl:res:dh+2]';
p = zeros(length(x),1);  

for i=1:length(x),
  p(i) = 1/numpts * sum(normpdf(x(i), data, sigma));
end;

end