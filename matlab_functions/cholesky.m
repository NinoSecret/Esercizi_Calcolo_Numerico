function x = cholesky(A, b)

% Otteniamo la dimensione della matrice
n = size(A, 1);

% Eseguiamo la decomposizione di Cholesky
L = zeros(n, n);
for j = 1:n
    % Calcolo l'elemento diagonale
    L(j,j) = sqrt(A(j,j) - L(j,1:j-1)*L(j,1:j-1)');
    
    % Calcolo gli elementi non diagonali
    for i = j+1:n
        L(i,j) = (A(i,j) - L(i,1:j-1)*L(j,1:j-1)') / L(j,j);
    end
end

% Risolviamo il sistema lineare L*y = b
y = zeros(n, 1);
for i=1:n
    y(i) = b(i);
    for j=1:i-1
        y(i) = y(i) - L(i, j) * y(j);
    end
    y(i) = y(i) / L(i, i);
end

% Risolviamo il sistema lineare L'*x = y
x = zeros(n, 1);
for i=n:-1:1
    x(i) = y(i);
    for j=i+1:n
        x(i) = x(i) - L(j, i) * x(j);
    end
    x(i) = x(i) / L(i, i);
end

end
