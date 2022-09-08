function p = prediction(theta, X)
    m = size(X, 1); 
    p = zeros(m, 1);
    p = sigmoide(X * theta) >= 0.5;
end
