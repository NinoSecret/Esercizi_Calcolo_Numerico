function [d] = g4e1(A)
% Calcolo del determinante di una matrice utilizzando il metodo di Gauss
    [n, m] = size(A);
    if n ~= m
        error('La matrice deve essere quadrata');
    end
    for i = 1:n
        for j = i+1:n
            factor = A(j,i)/A(i,i);
            A(j, :) = A(j, :) - factor * A(i, :);
        end
    end
    d = prod(diag(A));
end