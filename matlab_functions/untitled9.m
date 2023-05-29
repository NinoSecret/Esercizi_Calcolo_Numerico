n = 20;  % per n > 12
A = 19 * eye(n);  % matrice diagonale a 19
A(1, 2:n) = -1;  % prima riga restante a -1
A(2:n, 1) = 1;  % prima colonna restante a 1
b = A * ones(n, 1);  % vettore b

x = zeros(n, 1);  % vettore iniziale
eps = 1e-10;  % tolleranza
max_iter = 1000;  % numero massimo di iterazioni

D = diag(diag(A));
R = A - D;
invD = inv(D);

for i = 1:max_iter
    x_new = invD * (b - R * x);  % formula per il metodo di Jacobi
    if max(abs(x_new - x)) < eps
        break;
    end
    x = x_new;
end

disp(x);
