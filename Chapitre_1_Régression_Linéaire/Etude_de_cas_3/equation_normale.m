function theta= equation_normale(X,Y)
    theta=pinv(X' * X)*X'*Y;
end