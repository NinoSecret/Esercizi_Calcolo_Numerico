function [normH, normW] = normTable(a, b)
% Funzione di Davide Ferrara, Vitaliy Lyaskovskiy, Antonio Segreto

% parametri in ingresso
% estremi dell'intervallo degli ordini
% a = ordine minimo
% b = ordine massimo

% Inizializza una matrice vuota per le norme
normH = zeros(b, 4);
normW = zeros(b, 4);

% Calcolo delle norme
for n = a:b
    
    % Calcola le quattro norme della matrice
    
    A=hilb(n);
    B=wilki(n);

    % 1. Norma 1
    normH(n, 1) = norma(A,1);
    normW(n, 1) = norma(B,1);

    % 2. Norma 2
    normH(n, 2) = norma(A,2);
    normW(n, 2) = norma(B,2);

    % 3. Norma infinito
    normH(n, 3) = norma(A,'inf');
    normW(n, 3) = norma(B,'inf');
    
    % 4. Norma di Frobenius
    normH(n, 4) = norma(A,'fro');
    normW(n, 4) = norma(B,'fro');
end

end

