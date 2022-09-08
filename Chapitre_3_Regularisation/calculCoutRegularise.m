function [J, grad] = calculCoutRegularise(theta, X, y, lambda)

m = length(y); % nombre d'instances

% initialiser le cout J et les gradients du cout par rapport aux thetas à 0 
J = 0;
grad = zeros(size(theta));

% calculer l'hypothèse
h_theta = sigmoide(X*theta);

% calculer le cout J
J = (1/m) * (-y' * log(h_theta) - (1-y)' * log(1-h_theta)) + (lambda/(2*m)) * (theta(2:length(theta)))' * theta(2:length(theta));

% calculer le gradient
thetaZero = theta;
thetaZero(1) = 0;
grad = ((1 / m) * (h_theta - y)' * X) + lambda / m * thetaZero';

end