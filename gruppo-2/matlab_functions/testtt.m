% Metodi di risoluzione
solvers = {@gauss_elimination, @cholesky_decomposition, @jacobi_method, @gauss_seidel};

% Array per memorizzare gli errori
errors = zeros(5, length(solvers));

for n = 5:9 % Sistema di dimensioni crescenti
    % Creazione della matrice di Hilbert
    H = hilb(n);

    % Vettore b con la somma degli elementi per riga
    b = sum(H, 2);

    % Soluzione esatta
    x_exact = H\b;

    for i = 1:length(solvers)
        % Soluzione approssimata
        x_approx = solvers{i}(H, b);

        % Calcolo dell'errore
        errors(n-4, i) = norm(x_exact - x_approx);
    end
end

% Tabella degli errori
T = array2table(errors, 'VariableNames', {'Gauss', 'Cholesky', 'Jacobi', 'Gauss-Seidel'})

% Grafico degli errori
figure
semilogy(5:9, errors)
legend('Gauss', 'Cholesky', 'Jacobi', 'Gauss-Seidel')
xlabel('Dimensione della matrice')
ylabel('Errore')
title('Confronto tra errori nei vari metodi')
