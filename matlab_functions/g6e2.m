function g6e2(A, b, max_iter, tol)
% Esercizio di Davide Ferrara, Vitaliy Lyaskovskiy, Antonio Segreto

x0 = zeros(length(b), 1); % inizializzazione a zero del vettore x0

% Metodo di Jacobi
[x_jacobi, iter_jacobi, error_jacobi] = jacobi(A, b, x0, max_iter, tol);
fprintf('Metodo di Jacobi:\n');
fprintf('Soluzione: '); disp(x_jacobi);
fprintf('Iterazioni: %d\n', iter_jacobi);

% Metodo di Gauss-Seidel
[x_gs, iter_gs, error_gs] = gauss_seidel(A, b, x0, max_iter, tol);
fprintf('Metodo di Gauss-Seidel:\n');
fprintf('Soluzione: '); disp(x_gs);
fprintf('Iterazioni: %d\n', iter_gs);

% Grafico dell'errore
figure;
plot(1:iter_jacobi, error_jacobi, 'b-', 1:iter_gs, error_gs, 'r-');
legend('Jacobi', 'Gauss-Seidel');
xlabel('Iterazioni');
ylabel('Errore');
title('Confronto tra i metodi di Jacobi e Gauss-Seidel');
end

