function theta = descenteGradient(X,y,theta,alpha,m,nb_iterations)

for it = 1:nb_iterations
    h = X * theta;
    difference = h-y;
    
    
%     % option 1
%     temp0 = theta(1) - alpha /m * sum(difference);
%     temp1 = theta(2) - alpha /m * sum(difference .* X(:,2));  %theta_nouveau = [theta0,theta1] 
%     theta = [temp0, temp1];
    
    %option 2
    n = length(theta);
    temp = theta;    
    
    for j=1:n
        temp(j,1) = sum(difference .* X(:,j));    
    end
    theta = theta - alpha /m * temp;
    
end

end