%
% MED(mu, X, Y)
%
% This method determines boundaries based on the MED decision rule.
%
% Parameters
% mu: 3D matrix (1,2,n) containing the mean vectors of n classes
% X: x-coordinates of sampling grid
% Y: y-coordinates of sampling grid
%

function decision_grid = MED(mu, X, Y)

X = repmat(X,[1,1,size(mu,3)]);
Y = repmat(Y,[1,1,size(mu,3)]);
decision_grid = (X-mu(1,1,:)).^2 + (Y-mu(1,2,:)).^2;
decision_grid = classify_data(decision_grid);

end