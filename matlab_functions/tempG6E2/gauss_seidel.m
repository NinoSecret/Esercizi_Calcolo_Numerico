% Funzione per il metodo di Gauss-Seidel
function [x, iter, error] = gauss_seidel(A, b, x0, max_iter, tol)
    n = length(b); % Dimensione del sistema lineare

    x = x0; % Inizializzazione della soluzione
    error = zeros(max_iter, 1); % Array per tracciare l'errore ad ogni iterazione

    % Ciclo iterativo
    for iter = 1:max_iter
        x_old = x; % Memorizzazione della soluzione dell'iterazione precedente

        % Calcolo della nuova soluzione
        for i = 1:n
            sumAx1 = 0;
            for j = 1:i-1
                sumAx1 = sumAx1 + A(i, j) * x(j);
            end

            sumAx2 = 0;
            for j = i+1:n
                sumAx2 = sumAx2 + A(i, j) * x_old(j);
            end

            x(i) = (b(i) - sumAx1 - sumAx2) / A(i, i);
        end

        % Calcolo dell'errore come la norma 2 della differenza tra le soluzioni attuali e precedenti
        error(iter) = norm(x - x_old, 2);

        % Se l'errore è minore della tolleranza, interrompi il ciclo
        if error(iter) < tol
            break;
        end
    end

    % Riduci l'array degli errori alla dimensione effettiva del numero di iterazioni
    error = error(1:iter);
end