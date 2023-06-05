function [x] = GET(A, b)
% Gauss Elimination con pivoting totale
    n = size(A, 1);
    
    % Creazione dell'array di indici per tenere traccia degli scambi di righe e colonne
    index = 1:n;
    
    for k = 1:n-1
        % Ricerca del pivot massimo nella sottomatrice residua
        pivot = 0;
        pivotRow = k;
        pivotCol = k;
        for i = k:n
            for j = k:n
                if abs(A(i,j)) > pivot
                    pivot = abs(A(i,j));
                    pivotRow = i;
                    pivotCol = j;
                end
            end
        end
        
        % Scambio della riga contenente il pivot massimo con la riga corrente
        A([k, pivotRow], :) = A([pivotRow, k], :);
        
        % Scambio della colonna contenente il pivot massimo con la colonna corrente
        A(:, [k, pivotCol]) = A(:, [pivotCol, k]);
        
        % Scambio degli indici delle righe e delle colonne per mantenere coerenza con le modifiche alla matrice
        index([k, pivotRow]) = index([pivotRow, k]);
        
        % Eliminazione gaussiana con il pivot massimo
        for i = k+1:n
            m = A(i,k) / A(k,k);
            A(i,k) = 0;
            for j = k+1:n
                A(i,j) = A(i,j) - m * A(k,j);
            end
            b(i) = b(i) - m * b(k);
        end
    end
    
    % Risoluzione del sistema triangolare superiore
    x = backSubstitution(A, b);
    
    % Riordino dei risultati in base agli scambi di righe e colonne
    x(index) = x;
end

% Funzione ausiliaria per la sostituzione all'indietro
function [x] = backSubstitution(U, b)
    n = size(U, 1);
    x = zeros(n, 1);
    
    for i = n:-1:1
        x(i) = (b(i) - U(i, i+1:n) * x(i+1:n)) / U(i,i);
    end
end

