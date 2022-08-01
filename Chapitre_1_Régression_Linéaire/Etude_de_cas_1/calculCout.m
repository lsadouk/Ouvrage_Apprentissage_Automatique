function J= calculCout(X,y,theta,m)
    h = X * theta;
    erreurs = (h - y).^2;
    J = 1/(2*m) * sum(erreurs);
end


% X (m,2)
% theta (2,1)
% h (m,1)