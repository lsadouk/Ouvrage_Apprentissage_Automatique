%% Charger les données
data = csvread('BD_2.txt');
X = data(:, 1:2);
y = data(:, 3);

%% Configuration initiale
m = length(y);
X = [ones(m, 1) X];

%% Equation normale
% Calculer les paramètres avec l'équation normale
theta = equation_normale(X, y);
   
% Afficher les résultats
fprintf('Theta calculés à partir de l’’équation normale : \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimer le prix d'une maison à 1900 m^2 et à 2 chambres
X = [1900,3];
prix = [1, X] * theta;
fprintf(['Estimation du prix d''une maison à 1900 m^2 et à 2 chambres :\n %f Dh\n'], prix);

