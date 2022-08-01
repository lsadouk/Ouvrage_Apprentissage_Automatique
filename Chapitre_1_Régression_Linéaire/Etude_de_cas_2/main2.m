

%% ================ Part 1: Feature Normalization ================

%% Charger les données
data = load('BD_2.txt');
X = data(:, 1:2);
y = data(:, 3);

%% Visualiser les 5 premières instances
fprintf('Les 5 premières instances de la base de données sont : \n');
fprintf(' X = [%.0f %.0f], y = %.0f \n', [X(1:5,:) y(1:5,:)]');

%% Normaliser les données

X = miseEchelle(X);


%% Configuration
m = length(y);
% Ajouter une colonne de 0 à X
X = [ones(m, 1) X];

alpha = 0.01;
nb_iterations = 1000;
theta = zeros(3, 1);

%% Descente du gradient
[theta, J_nbIterations] = descenteGradient(X, y, theta, alpha,m, nb_iterations);
% Afficher les paramètres optimaux
fprintf('Theta optimaux : \n');
fprintf(' %f \n', theta);
fprintf('\n');

%% Visualisation de l'évolution du cout en fonction du nombre d'ítérations
figure;
plot(1:numel(J_nbIterations), J_nbIterations, '-b', 'LineWidth', 2);
xlabel('Nombre itérations');
ylabel('Cout J');

%% Estimer le prix d'une maison à 1900 m^2 et à 2 chambres
X = [1900,3];
X= miseEchelle(X);
prix = [1, X] * theta;
fprintf(['Estimation du prix d''une maison à à 1900 m^2 et à 2 chambres :\n %f Dh\n'], prix);




