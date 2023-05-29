function x = jacobiMethodBanda(diag_main, diag_upper1, diag_upper2, diag_upper3, diag_lower1, diag_lower2, diag_lower3, b)
    % dimensione del sistema
    n = length(b);
    
    % inizializzazione del vettore soluzione
    x = zeros(n, 1);
    
    % criterio di arresto
    eps = 1e-6;
    
    % numero massimo di iterazioni
    max_iterations = 1000;
    
    for k = 1:max_iterations
        x_old = x;
        
        for i = 1:n
            sum_term = 0;
            
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
            
            x(i) = (b(i) - sum_term) / diag_main(i);
        end
        
        % Controllo del criterio di arresto
        if norm(x - x_old, inf) < eps
            break;
        end
    end
end