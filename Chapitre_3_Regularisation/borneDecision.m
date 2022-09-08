function borneDecision(theta, X, y)


% Plot Data
visualiserBD(X(:,2:3), y);
hold on


    % fixer l'intervalle de la grille
    u = linspace(-1, 1.5, 50);
    v = linspace(-1, 1.5, 50);

    z = zeros(length(u), length(v));
    % Evaluer z = theta*x sur la grille
    for i = 1:length(u)
        for j = 1:length(v)
            X = ajouterAttributs(u(i), v(j));
            %X = [1 X]; 
            z(i,j) = X * theta;
        end
    end
    % utiliser
    z = z'; 

    % % tracer z tout en indiquant l'intervalle [0,0]
    contour(u, v, z, [0,0], 'LineWidth', 2)

hold off

end
