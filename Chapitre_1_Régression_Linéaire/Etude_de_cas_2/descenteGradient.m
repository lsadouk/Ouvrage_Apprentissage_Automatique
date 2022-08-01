function [theta,J]= descenteGradient(x,y,theta,alpha,m,nb_iterations)
    J=zeros(nb_iterations,1);
    for it = 1:nb_iterations 
        h= x * theta;
        theta = theta - alpha/m * x' * (h-y);

        J(it) = calculCout(x,y,theta,m);
    end
end