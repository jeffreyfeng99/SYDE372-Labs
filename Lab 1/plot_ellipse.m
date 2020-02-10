%
% Plot_Ellipse(x,y,theta,a,b)
%
% This routine plots an ellipse with centre (x,y), axis lengths a,b
% with major axis at an angle of theta radians from the horizontal.
%
% x : x-coord of mean vector
% y : y-coord of mean vector
% theta: angle of rotation
% a,b : axes lengths
%
% Author: P. Fieguth
%         Jan. 98
%

function plot_ellipse(x,y,theta,a,b,ellipse_colour)

if nargin<5, error('Too few arguments to Plot_Ellipse.'); end

np = 100;
ang = [0:np]*2*pi/np; % Array of np + 1 points from 0 to 2*pi
pts = [x;y]*ones(size(ang)) + [cos(theta) -sin(theta); sin(theta) cos(theta)]*[cos(ang)*a; sin(ang)*b];
plot(pts(1,:), pts(2,:), 'Color', ellipse_colour);

end