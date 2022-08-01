function J= calculCout( X,y,theta,m )
h = X * theta ;
erreur = (h - y).^2;
J =1/(2*m) * sum(erreur);

end