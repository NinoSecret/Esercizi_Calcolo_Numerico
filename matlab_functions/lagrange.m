function L = lagrange(x, table)
% INPUT:
% x: punti per la visualizzazione del polinomio interpolante
% table:
% xi | yi
% -1 | 0.1
%  0 | 1
%  1 | 0.1

x_interp = table(:,1);
y_interp = table(:,2);

% Calcolo del polinomio interpolante di Lagrange
n = length(x_interp); % Nodi
L = zeros(size(x)); 

for i = 1:n 
    % Calcolo dei termini del polinomio di Lagrange
    Li = ones(size(x));
    for j = 1:n
        if j ~= i
            Li = Li .* (x - x_interp(j)) / (x_interp(i) - x_interp(j)); % Polinomio Nodale
        end
    end
    
    L = L + y_interp(i) * Li;
end

