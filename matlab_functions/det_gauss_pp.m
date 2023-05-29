function [U, det]=det_gauss_pp(A)
n = size(A,1);
U = A;
det = 1;

for k = 1: n-1
    % Pivoting
    [piv, j] = max(abs(A(k:n,k))); 
    % Determinante uguale a zero
    if (piv == 0) 
        det = 0;
        return
    end
    A
    % Scambio le righe e cambio il segno del determinante
    if (j ~= 1) 
        temp = A(j+k-1,:);
        A(j+k-1,:) = A(k,:);
        A(k,:) = temp;
        det = -det;
    end
    A
    % Gauss Elimination
    for i = k+1 : n
        quot = A(i,k) / A(k,k);
        quot
        A(i,k) = 0;
        for j = k+1 : n
            A(i,j) = A(i,j)- quot *A(k,j);
        end
    end
    
end

U=A;
% Calcolo il detrminante
det_U=prod(diag(U));
det=det*det_U;