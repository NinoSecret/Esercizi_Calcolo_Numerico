function [condH, condW] = condTable(a,b)

% [a,b] estremi dell'intervallo degli ordini

% Inizializza una matrice vuota per le norme
condH = zeros(b, a);
condW = zeros(b, a);

% Calcolo degli indici di cond. dove cond(A) = ||A|| * ||A^-1||
for n = a:b

    % Generazione delle matrice di Hilbert e Wilkinson al crescere di n
    A=hilb(n);
    B=wilki(n);

    % Cond. Norma 2
    condH(n, 1) = cond(A, 2);
    condW(n, 1) = cond(B, 2);

    % Cond. Norma inf.
    condH(n, 2) = cond(A, 'inf');
    condW(n, 2) = cond(B, 'inf');

end

end

