function L = lagrange(x, table)
% INPUT:
% xi | yi
% -1 | 0.1
%  0 | 1
%  1 | 0.1

% Punti di interpolazione personalizzati
x_interp = table(:,1);

% Valutazione della funzione di Runge nei punti di interpolazione
y_interp = table(:,2);

% Calcolo del polinomio interpolante di Lagrange
n = length(x_interp);
L = zeros(size(x));

for i = 1:n
    % Calcolo dei termini del polinomio di Lagrange
    Li = ones(size(x));
    for j = 1:n
        if j ~= i
            Li = Li .* (x - x_interp(j)) / (x_interp(i) - x_interp(j));
        end
    end
    
    % Aggiunta del termine corrispondente al punto di interpolazione i-esimo
    L = L + y_interp(i) * Li;
end

