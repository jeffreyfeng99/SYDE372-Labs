function decision_grid = MED_V2(mu, X, Y)

X = repmat(X,[1,1,size(mu,3)]);
Y = repmat(Y,[1,1,size(mu,3)]);
decision_grid = (X-mu(1,1,:)).^2 + (Y-mu(1,2,:)).^2;

end