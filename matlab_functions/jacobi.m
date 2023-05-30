function x = jacobi(A, b, x, tol, maxit)
% By Davide Ferrara, Vitaliy Lyaskovskiy, Antonio Segreto
% Funzione per il metodo di Jacobi
function [x, iter, error] = jacobi(A, b, x0, max_iter, tol)
    n = length(b); % Dimensione del sistema lineare

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
    x = x0; % Inizializzazione della soluzione
    error = zeros(max_iter, 1); % Array per tracciare l'errore ad ogni iterazione

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
    % Ciclo iterativo
    for iter = 1:max_iter
        x_old = x; % Memorizzazione della soluzione dell'iterazione precedente

% Vettore colonna delle soluzioni x 
dx = zeros(na,1);
for k=1:maxit
    sum = 0;
    for i=1:na
        dx(i) = b(i);
        for j=1:na
            dx(i) = dx(i) - A(i,j)*x(j); 
        % Calcolo della nuova soluzione
        for i = 1:n
            sum_term = 0;
            for j = 1:n
                if i ~= j
                    sum_term = sum_term + A(i, j) * x_old(j);
                end
            end
            x(i) = (b(i) - sum_term) / A(i, i);
        end
        dx(i) = dx(i)/A(i,i);
        x(i) = x(i) + dx(i);
        if (dx(i) >= 0)
            sum = sum + dx(i);
        else 
            sum = sum - dx(i);

        % Calcolo dell'errore come la norma 2 della differenza tra le soluzioni attuali e precedenti
        error(iter) = norm(x - x_old, 2);

        % Se l'errore è minore della tolleranza, interrompi il ciclo
        if error(iter) < tol
            break;
        end
    end
    if(sum <= tol)
        break
    end

    % Riduci l'array degli errori alla dimensione effettiva del numero di iterazioni
    error = error(1:iter);
end
fprintf('La soluzione è %g, con un numero di iterazioni di \n', k);