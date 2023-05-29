function x = jacobi(A, b, x, tol, maxit)
% By Davide Ferrara, Vitaliy Lyaskovskiy, Antonio Segreto

%-------------------------------------------------------
% Metodo di Jacobi per risolvere A*x = b.
%
% INPUT :
%   A        MAtrice n*n
%   b        Vettore dei termini noti
%   epsilon  Precisione/Tolleranza
%   maxit    Massimo numero di Iterazioni
%   x        Vettore iniziale per le iterazioni
%
% OUTPUT:
%   x        Soluzione approssimata do A*x = b.
%-------------------------------------------------------

% Controllo se la matrice è quadrata
[na, ma] = size(A);
if na ~= ma
    disp('ERROR: La Matrice deve essesere quadrata!')
    return
end

% Controllo se il vettore b è un vettore colonna
[nb, mb] = size (b);
if nb ~= na || mb~=1
   disp( 'ERROR: b deve essere un vettore colonna!')
   return
end

% Vettore colonna delle soluzioni x 
dx = zeros(na,1);
for k=1:maxit
    sum = 0;
    for i=1:na
        dx(i) = b(i);
        for j=1:na
            dx(i) = dx(i) - A(i,j)*x(j); 
        end
        dx(i) = dx(i)/A(i,i);
        x(i) = x(i) + dx(i);
        if (dx(i) >= 0)
            sum = sum + dx(i);
        else 
            sum = sum - dx(i);
        end
    end
    if(sum <= tol)
        break
    end
end
fprintf('La soluzione è %g, con un numero di iterazioni di \n', k);