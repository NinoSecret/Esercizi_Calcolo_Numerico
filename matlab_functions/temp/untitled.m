% Dati del sistema lineare
n = 3;
A = [3, 0, 4; 7, 4, 2; -1, -1, -2];
b = [7; 13; -4];

% Inizializzazione delle soluzioni e degli errori
x_jacobi = zeros(n, 1);
x_gs = zeros(n, 1);
error_jacobi = [];
error_gs = [];

% Definizione dei criteri di arresto
tolerance = 1e-6; % Tolleranza per il criterio di convergenza
max_iterations = 100; % Numero massimo di iterazioni

% Metodo di Jacobi
fprintf("Metodo di Jacobi:\n");
for k = 1:max_iterations
    x_jacobi_old = x_jacobi;
    for i = 1:n
        x_jacobi(i) = (b(i) - A(i,1:i-1)*x_jacobi_old(1:i-1) - A(i,i+1:n)*x_jacobi_old(i+1:n)) / A(i,i);
    end
    
    % Calcolo dell'errore
    error = norm(x_jacobi - x_jacobi_old);
    error_jacobi = [error_jacobi; error];
    
    % Verifica del criterio di convergenza
    if error < tolerance
        break;
    end
end

fprintf("Soluzione di Jacobi:\n");
disp(x_jacobi);
fprintf("Numero di iterazioni di Jacobi: %d\n", k);
fprintf("\n");

% Metodo di Gauss-Seidel
fprintf("Metodo di Gauss-Seidel:\n");
for k = 1:max_iterations
    x_gs_old = x_gs;
    for i = 1:n
        x_gs(i) = (b(i) - A(i,1:i-1)*x_gs(1:i-1) - A(i,i+1:n)*x_gs_old(i+1:n)) / A(i,i);
    end
    
    % Calcolo dell'errore
    error = norm(x_gs - x_gs_old);
    error_gs = [error_gs; error];
    
    % Verifica del criterio di convergenza
    if error < tolerance
        break;
    end
end

fprintf("Soluzione di Gauss-Seidel:\n");
disp(x_gs);
fprintf("Numero di iterazioni di Gauss-Seidel: %d\n", k);
fprintf("\n");

% Plot degli errori
figure;
iterations = 1:length(error_jacobi);
plot(iterations, error_jacobi, 'b-', 'LineWidth', 2);
hold on;
plot(iterations, error_gs, 'r--', 'LineWidth', 2);
xlabel('Iterazioni');
ylabel('Errore');
title('Confronto degli errori nei vari iterati');
legend('Jacobi', 'Gauss-Seidel');
grid on;
