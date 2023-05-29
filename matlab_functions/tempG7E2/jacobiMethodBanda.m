function x = jacobiMethodBanda(diag_main, diag_upper1, diag_upper2, diag_upper3, diag_lower1, diag_lower2, diag_lower3, b)
    % dimensione del sistema
    n = length(b);  % La lunghezza del vettore b determina la dimensione del sistema lineare.
    
    % inizializzazione del vettore soluzione
    x = zeros(n, 1);  % Inizializza la soluzione x come un vettore colonna di zeri.
    
    % criterio di arresto
    eps = 1e-6;  % La precisione desiderata. L'algoritmo si ferma quando la differenza tra le soluzioni di due iterazioni successive è inferiore a eps.
    
    % numero massimo di iterazioni
    max_iterations = 1000;  % L'algoritmo si ferma anche se non ha raggiunto la precisione desiderata dopo max_iterations iterazioni.
    
    % Iterazioni di Jacobi
    for k = 1:max_iterations
        x_old = x;  % Salva la soluzione corrente prima di calcolare la nuova.
        
        % Calcolo della nuova soluzione
        for i = 1:n
            sum_term = 0;  % Inizializza la somma dei termini non diagonali.
            
            % Calcolo della somma dei termini non diagonali
            if i > 1
                sum_term = sum_term + diag_lower1(i-1) * x_old(i-1);
            end
            if i > 2
                sum_term = sum_term + diag_lower2(i-2) * x_old(i-2);
            end
            if i > 3
                sum_term = sum_term + diag_lower3(i-3) * x_old(i-3);
            end
            if i < n
                sum_term = sum_term + diag_upper1(i) * x_old(i+1);
            end
            if i < n-1
                sum_term = sum_term + diag_upper2(i) * x_old(i+2);
            end
            if i < n-2
                sum_term = sum_term + diag_upper3(i) * x_old(i+3);
            end
            
            % Calcolo del nuovo termine x(i) della soluzione
            x(i) = (b(i) - sum_term) / diag_main(i);
        end
        
        % Controllo del criterio di arresto
        if norm(x - x_old, inf) < eps  % Se la norma infinito (la massima differenza assoluta tra le componenti) tra x e x_old è inferiore a eps, l'algoritmo si ferma.
            break;
        end
    end
end
