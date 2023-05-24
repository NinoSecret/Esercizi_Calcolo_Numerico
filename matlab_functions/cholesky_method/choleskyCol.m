function L = choleskyCol(A)
% Calcola la fattorizzazione di Cholesky di una matrice simmetrica e definita positiva.
% Applicabile se A = L*L'
% Ritorna la matrice triangolare bassa L 
% O = 1/6 n^3
% (pag 3 CN_4 Tecniche compatte Bini)

n = size(A, 1);
L = zeros(n, n);

for j = 1:n
    % Calcolo l'elemento diagonale
    L(j,j) = sqrt(A(j,j) - L(j,1:j-1)*L(j,1:j-1)');
    
    % Calcolo gli elementi diagonali
    for i = j+1:n
        L(i,j) = (A(i,j) - L(i,1:j-1)*L(j,1:j-1)') / L(j,j);
    end
end

end