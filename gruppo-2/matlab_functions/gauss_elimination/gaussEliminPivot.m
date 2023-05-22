function [x] = gaussEliminPivot(A, b)
% Gauss Elimination con Pivot
% Questo algoritmo è più stabile rispetto all'eliminazione di Gauss senza pivoting e
% può gestire matrici singolari e matrici con elementi diagonali molto piccoli.
n = size(A, 1);

for k = 1:n-1
    % Pivoting
    [max_val, max_idx] = max(abs(A(k:n, k)));
    max_idx = max_idx + k - 1;
    if max_val == 0
        error('Matrice singolare!');
    end
    A([k,max_idx], k:n) = A([max_idx,k], k:n);
    b([k,max_idx]) = b([max_idx,k]);

    % Elimination
    for i = k+1:n
        factor = A(i,k) / A(k,k);
        A(i,k:n) = A(i,k:n) - factor * A(k,k:n);
        b(i) = b(i) - factor * b(k);
    end
end

% Back Substitution
x = backSub(A, b);

end