function [outputArg1,outputArg2] = normTable(inputArg1,inputArg2)
% Inizializza una matrice vuota per le norme
norms = zeros(b, 4);

% Loop attraverso i valori di n
for n = a:b
    
    % Crea una matrice di Hilbert di ordine n
    H = hilb(n);
    
    % Calcola le quattro norme
    
    % 1. Norma 1
    norms(n, 1) = max(sum(abs(H), 1));
    
    % 2. Norma 2
    norms(n, 2) = max(abs(eig(H)));
    
    % 3. Norma infinito
    norms(n, 3) = max(sum(abs(H), 2));
    
    % 4. Norma di Frobenius
    norms(n, 4) = sqrt(trace(H'*H));
    
end
end

