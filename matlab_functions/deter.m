function [det] = deter(A)
% Funzione per il calcolo del determinante.
% 
% La funziona applica il metodo di Gauss e successivamente calcola il
% determinante come il prodotto degli elementi sulla diagonale principale 
% divisi per d.
%
% Il calcolo del determinante tramite questa procedura è il sistema meno 
% impegnativo che si conosca dal punto di vista computazionale 
% (crescita polinomiale O(n^3) invece che fattorialeO(n!) ed è 
% l'unico applicabile quando le dimensioni delle matrici diventano grandi.

% Triangolarizzo la matrice A usand l'eliminazione di Gauss

[n,m] = size(A);

if mod(n+m,2)==1
    disp("La matrice inserita non è quadrata!")
    return
else
    A_1 = GEM(A);
    
    det = A_1(1,1);
    
    % Prodotto della diagonale principale
    for i = 2 : n
        det = det * A_1(i,i);
    end
end
end
