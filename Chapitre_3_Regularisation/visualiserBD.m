function visualiserBD(X, y)
    positif = find(y == 1); 
    negatif = find(y == 0);
    
    figure; 
    hold on;
    
    plot(X(positif, 1), X(positif, 2), '+','LineWidth', 2, ...
    'MarkerSize', 5);
    plot(X(negatif, 1), X(negatif, 2), 'o', 'MarkerFaceColor', 'y', ...
    'MarkerSize', 5);
    
    hold off;
    % intitulé des axes
    xlabel('Résultat test 1')
    ylabel('Résultat test 2')
    
    % legend
    legend('Acceptée', 'Non acceptée')

end
