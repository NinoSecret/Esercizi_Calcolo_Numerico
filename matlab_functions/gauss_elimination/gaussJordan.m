function [x] = gaussJordan(A, b)
% Gauss-Jordan Elimination
% Risolve il sistema Ax = b, dove A è una nxn matrice e b è un vettore nx1
% Ritorna la soluzione x in un vettore nx1
% Questo significa che l'algoritmo di Gauss-Jordan può essere più veloce 
% dell'algoritmo di Gauss con pivoting per matrici di piccole dimensioni. 
% Inoltre, l'algoritmo di Gauss-Jordan produce direttamente la matrice identità, il che può essere utile in alcune applicazioni.

% (pag 47 CN_4_Sistemi_Lineari)

n = size(A, 1);

% Concatenate A and b into augmented matrix
augmented = [A, b];

% Gauss-Jordan Elimination
for k = 1:n
    % Pivot
    if augmented(k,k) == 0
        error('Elemento diagonale nullo! Impossibile continuare l''eliminazione di Gauss-Jordan!');
    end
    augmented(k,:) = augmented(k,:) / augmented(k,k);
    for i = 1:n
        if i ~= k
            factor = augmented(i,k) / augmented(k,k);
            augmented(i,:) = augmented(i,:) - factor * augmented(k,:);
        end
    end
end

% Extract solution
x = augmented(:,n+1);

end