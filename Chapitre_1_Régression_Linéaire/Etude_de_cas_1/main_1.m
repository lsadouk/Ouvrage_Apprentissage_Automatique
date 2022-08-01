
data =load('BD_1.txt');
X = data(:,1);
y = data(:,2);

visualiserBD(X,y);

m = length(y);

%X = [ ones(m,1), data(:,1)];
X= [ ones(m,1), X ];

% initialisation 
theta = zeros(2, 1);
alpha = 0.01;
nb_iterations = 1500;

% calcul du cout
J = calculCout(X,y,theta,m);
fprintf('le cout initial (theta0=0 et theta1=0) %f ', J);

%calcul du theta à l'aide du gradient
theta = descenteGradient(X,y,theta,alpha,m,nb_iterations);
fprintf('les valeurs de theta0 et theta1 sont: %f %f \n', theta(1),theta(2));

% prediction de la population 35000 personnes
nouveau_X = [1, 3.5];
h_nouveau = nouveau_X * theta;
fprintf('Prédiction du gain pour la population de 35000 est %f \n', h_nouveau);

% prediction de la population 70000 personnes
nouveau_X = [1, 7];
h_nouveau = nouveau_X * theta;
fprintf('Prédiction du gain pour la population de 70000 est %f \n', h_nouveau);

% ajustement linéaire
figure,
visualiserBD(X(:,2),y);
hold on
plot([0,25],[1,0;1,25]*theta, '-')
hold off
legend('Données','Ajustement linéaire : h(x)')

%% visualisation

% On Met la grille sur laquelle on calcule J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);
% On initialise J_vals à une matrice de zeros
J_vals = zeros(length(theta0_vals), length(theta1_vals));
% Fill out J_vals
for i = 1:length(theta0_vals)
 for j = 1:length(theta1_vals)
 t = [theta0_vals(i); theta1_vals(j)];
 J_vals(i,j) = calculCout(X, y, t, m);
 end
end

J_vals = J_vals';
% Surface plot
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');
% Contour plot
figure;
% on trace 15 contours espacés logarithmiquement entre 0.01 et 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);