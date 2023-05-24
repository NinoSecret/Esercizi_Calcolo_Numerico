function [d] = det_gauss(A)
% Gaussian elimination senza pivoting
% A e' una matrice quadrata
n = size(A);     

for i = 1:n-1
    % Eseguo la divsione con i multipli
    m = -A(i+1:n,i)/A(i,i); 
    A(i+1:n,:) = A(i+1:n,:) + m*A(i,:);
end

% Calcolo Determinante
d=prod(diag(A));

end