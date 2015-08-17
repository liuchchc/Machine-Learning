function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


sumTheta = lambda / (2 * m) * (sum(theta .* theta) - theta(1) * theta(1));
sumHJ = 0;
for i = 1:m
    sumHJ = sumHJ + y(i) * log(1 / (1 + exp(-1 * X(i,:)*theta))) + (1 - y(i)) * log(1 - 1 / (1 + exp(-1 * X(i,:)*theta)));
end
 
J = -sumHJ / m  + sumTheta;


gradColumn = size(theta);
for i = 1 : gradColumn
    sumG = 0;
    for j = 1 : m
        sumG = sumG + (1 / (1 + exp(-1 * (X(j,:)*theta))) - y(j)) * X(j, i);
    end
    if(i == 1)
        grad(i) = sumG / m ;
    else
        grad(i) = sumG / m + lambda / m * theta(i);
    end
end


% =============================================================

end
