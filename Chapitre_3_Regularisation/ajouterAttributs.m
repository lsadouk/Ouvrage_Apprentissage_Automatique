function nouveaux_att = ajouterAttributs(X1, X2)

puissance = 6;
nouveaux_att = ones(size(X1(:,1)));
for i = 1:puissance
    for j = 0:i
        nouveaux_att(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end

end