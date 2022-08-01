function x_nouveau= miseEchelle(X)
    sigma=std(X);
    moyenne =sum(X)./size(X,1);
    x_nouveau = (X- moyenne)./sigma;
end

