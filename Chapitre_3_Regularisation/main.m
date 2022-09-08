
%% Chargement des données
data = load('BD.txt');
X = data(:, [1, 2]); 
y = data(:, 3); 

%% Visualisation des données
fprintf(['Données telles que + indique les machines acceptées (i.e., y = 1) '...
            'et - les machines rejetées (i.e., y = 0).\n']);

%visualiserBD(X, y);

%% Génération d'attributs
X = ajouterAttributs(X(:,1), X(:,2));

%% Initialisation
[m, n] = size(X);
thetas = zeros(n , 1);
lambda = 1;

%% OPTIMIATION
% Calculer et afficher le cout and gradient pour les thetas initiaux

[cout, gradients] = calculCoutRegularise(thetas,X,y,lambda);

fprintf('Cout pour les thetas initiaux (zeros): %f\n', cout);
fprintf('Gradients pour les thetas initiaux (zeros): \n');
fprintf(' %f \n', gradients);

% initialiser les paramètres à zéro
thetas_initiaux = zeros(n, 1);

%  Configurer les options de fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Appeler fminunc pour obtenir les thetas optimaux
[thetas, cout] = ...
	fminunc(@(thetas)(calculCoutRegularise(thetas, X, y, lambda)), thetas_initiaux, options);

% Afficher les thetas optimaux
fprintf('Les thetas optimaux : \n');
fprintf(' %f \n', thetas);
% Afficher le cout obtenu en utilisant les thetas optimaux
fprintf('Cout des thetas optimaux : %f\n', cout);

pause;
% Tracer la courbe de décision
borneDecision(thetas, X, y);

%% EVALUATION DU MODELE
% Compute accuracy on our training set
p = prediction(thetas, X);

fprintf('Précision / Score : %f\n', mean(double(p == y)) * 100);


