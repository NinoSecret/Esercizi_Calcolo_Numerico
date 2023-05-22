
% Inizializzazione delle variabili
a = -1; % limite inferiore dell'intervallo
b = 1;  % limite superiore dell'intervallo

% Inizializzazione dei vettori per memorizzare i risultati
norm1_results = zeros(1,19);
norm2_results = zeros(1,19);
normInf_results = zeros(1,19);

% Calcolo delle norme per vettori di dimensioni diverse
for n = 2:20
    % Creazione del vettore con n punti equidistanti nell'intervallo [a, b]
    v = linspace(a, b, n);
    
    % Calcolo della norma-1 (somma dei valori assoluti)
    norm1 = sum(abs(v));
    norm1_results(n-1) = norm1;
    
    % Calcolo della norma-2 (radice quadrata della somma dei quadrati)
    norm2 = sqrt(sum(v.^2));
    norm2_results(n-1) = norm2;
    
    % Calcolo della norma-infinito (valore massimo assoluto)
    normInf = max(abs(v));
    normInf_results(n-1) = normInf;
end

% Creazione del grafico
figure;
plot(2:20, norm1_results, 'r', 'LineWidth', 2); hold on;
plot(2:20, norm2_results, 'g', 'LineWidth', 2); 
plot(2:20, normInf_results, 'b', 'LineWidth', 2); 

% Aggiunta di legenda e titoli
legend('Norma-1', 'Norma-2', 'Norma-Infinito', 'Location', 'northwest');
title('Norme Vettoriali per vettori di dimensione n');
xlabel('Dimensione del vettore (n)');
ylabel('Valore della Norma');
grid on;
hold off;