function [] = g2e2(a,b,m,n)
% Esercizio di Davide Ferrara, Vitaliy Lyaskovskiy, Antonio Segreto

% Inizializzazione delle variabili
% a limite inferiore dell'intervallo
% b limite superiore dell'intervallo
% m inizio del range
% n fine del range

% Inizializzazione dei vettori per memorizzare i risultati
norm1_results = zeros(1,n-1);
norm2_results = zeros(1,n-1);
normInf_results = zeros(1,n-1);

% Calcolo delle norme
for i = m:n
    % Creazione del vettore con n punti equidistanti nell'intervallo [a, b]
    v = linspace(a, b, i);
    
    % Calcolo della norma 1 (somma dei valori assoluti)
    norm1 = norma(v, 1);
    norm1_results(i-1) = norm1;
    
    % Calcolo della norma 2 (radice quadrata della somma dei quadrati)
    norm2 = norma(v, 2);
    norm2_results(i-1) = norm2;
    
    % Calcolo della norma infinito (valore massimo assoluto)
    normInf = norma(v, 'inf');
    normInf_results(i-1) = normInf;
end

% Creazione del grafico
figure;
hold on;
plot(m:n, norm1_results, 'r', 'LineWidth', 2);
plot(m:n, norm2_results, 'g', 'LineWidth', 2); 
plot(m:n, normInf_results, 'b', 'LineWidth', 2); 

% Aggiunta di legenda e titoli
legend('Norma-1', 'Norma-2', 'Norma-Infinito', 'Location', 'northwest');
title('Norme Vettoriali per vettori di dimensione n');
xlabel('Dimensione del vettore (n)');
ylabel('Valore della Norma');
grid on;
hold off;

end

