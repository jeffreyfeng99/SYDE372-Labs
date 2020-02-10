function [C, error] = error_rate(predicted, total)
% Parameters
% predicted -- column vector of all the classified points
% total -- row vector of class totals
%
% -------------------------------------------------------------------------
% Returns
% C -- confusion matrix based on predicted and total
% error -- P(e) calculated from C

% Create column vector of true classes to compare to predicted
% Repeat the class label for number of data points in that class
true_classes = [zeros(total(1),1); ones(total(2),1)];

% If there are 3 classes, add labels to true_classes
if length(total) > 2, true_classes = [true_classes; repmat(2,total(3),1)]; end

C = confusionmat(true_classes, predicted); % returns n_class x n_class matrix
error = (sum(total)-sum(diag(C))) / sum(total); % experimental error is total incorrect/total samples

end