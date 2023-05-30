% Definizione della matrice A e del vettore b
A = [0.96326, 0.81321; 0.81321, 0.68654];
b = [0.88824; 0.74988];

% Verifica se A è definita positiva
isPositive = issymmetric(A) && all(eig(A) > 0);
if isPositive
    % Metodo di Cholesky
    x_cholesky = cholesky(A,b);
    % Calcolo della norma del residuo per Cholesky (norma 2)
    residuo_cholesky = norma(A*x_cholesky - b,2); 

    % Stampa dei risultati del metodo di Cholesky
    fprintf('Soluzione Cholesky: [%f; %f]\n', x_cholesky);
    fprintf('Norma del Residuo Cholesky: %f\n\n', residuo_cholesky);
else
    disp('La matrice A non è definita positiva')
    return
end

% Calcolo della matrice di iterazione per Gauss-Seidel
D = diag(diag(A));
L = tril(A, -1);
U = triu(A, 1);
M_GS = (D + L)^-1 * U; 

% Calcolo della norma della matrice di iterazione (norma 2)
norm_M_GS = norm(M_GS); 

% Calcolo del raggio spettrale della matrice di iterazione
raggio_spettrale_M_GS = max(abs(eig(M_GS)));

% Definizione dei vettori iniziali
x0_vec = [[0.33116; 0.7], [0; 0], [1; 1]];

% Iterazione per ogni vettore iniziale
n = size(x0_vec, 2);
for i = 1 : n
    x0 = x0_vec(:, i);
    [x_gauss_seidel, iter, error] = gauss_seidel(A, b, x0, 1000, 1e-6);

    % Stampa dei risultati
    fprintf('Vettore iniziale: [%f; %f]\n', x0);
    fprintf('Soluzione Gauss-Seidel: [%f; %f]\n', x_gauss_seidel);
    fprintf('Iterazioni Gauss-Seidel: %d\n', iter);
    fprintf('Norma del Residuo Gauss-Seidel: %f\n\n', norm(A*x_gauss_seidel - b)); % Norma 2 del residuo
end

% Calcolo dell'indice di condizionamento di A
cond_A = cond(A); % ||A|| * ||inv(A)||

% Stampa dei risultati
fprintf('Indice di condizionamento di A: %f\n', cond_A);
fprintf('Norma della matrice di iterazione: %f\n', norm_M_GS);
fprintf('Raggio spettrale della matrice di iterazione: %f\n', raggio_spettrale_M_GS);

