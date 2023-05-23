% Definizione delle funzioni
s = @(x) ((x - 1.2) .* sin(3.*x) + 1 ./ (x + 1) .* sin(1 + x .* x)) .* sin(x ./ 2);  % Definizione del segnale pulito s(x)
r = @(x) 0.1 .* sin(7 .* x) + 2 .* sin(23 .* x) .* cos(31 .* x) .* sin(1 - 19 .* x);  % Definizione del rumore r(x)
f = @(x) s(x) + r(x);  % Definizione del segnale con rumore f(x)

% Creazione del vettore di punti
x = linspace(0, 2 * pi, 256);  % Genera 256 punti equamente distanziati nell'intervallo [0, 2π]

% Calcolo dei valori di f(x)
fx = f(x);  % Calcola f(x) per tutti i punti in x

% Inizializzazione del minimo errore e del grado ottimale
min_error = Inf;  % Inizializza l'errore minimo a Infinito
optimal_degree = -1;  % Inizializza il grado ottimale a -1

% Loop sui gradi del polinomio da 0 a 20
for degree = 0:20
    % Approssimazione polinomiale
    p = polyfit(x, fx, degree);  % Approssima f(x) con un polinomio di grado 'degree'
    
    % Calcolo del segnale approssimato
    px = polyval(p, x);  % Valuta il polinomio nei punti x per ottenere il segnale approssimato
    
    % Calcolo dell'errore
    error = norm(px - s(x));  % Calcola l'errore come la norma 2 tra il segnale approssimato e il segnale pulito s(x)
    
    % Aggiornamento del minimo errore e del grado ottimale
    if error < min_error  % Se l'errore corrente è minore del minimo errore fino a ora
        min_error = error;  % Aggiorna l'errore minimo
        optimal_degree = degree;  % Aggiorna il grado ottimale
        optimal_poly = p;  % Aggiorna il polinomio ottimale
    end
end

% Stampa del grado ottimale
fprintf('Grado ottimale: %d\n', optimal_degree);  % Stampa il grado ottimale del polinomio

% Calcolo del segnale pulito e del segnale approssimato ottimale
sx = s(x);  % Calcola il segnale pulito s(x) per tutti i punti in x
optimal_px = polyval(optimal_poly, x);  % Calcola il segnale approssimato ottimale per tutti i punti in x

% Plot del polinomio approssimante con f(x)
figure;  % Crea una nuova figura
plot(x, fx, 'bo');  % Plotta f(x) come punti blu
hold on;  % Mantiene il grafico corrente 
plot(x, optimal_px, 'r-');  % Plotta il polinomio approssimante come linea rossa
title('Polinomio approssimante e f(x)');  % Imposta il titolo del grafico
legend('f(x)', 'Polinomio approssimante');  % Aggiunge una legenda al grafico

% Plot del polinomio approssimante con s(x)
figure;  % Crea una nuova figura
plot(x, sx, 'g-');  % Plotta s(x) come linea verde
hold on;  % Mantiene il grafico corrente attivo per il prossimo plot
plot(x, optimal_px, 'r-');  % Plotta il polinomio approssimante come linea rossa
title('Polinomio approssimante e s(x)');  % Imposta il titolo del grafico
legend('s(x)', 'Polinomio approssimante');  % Aggiunge una legenda al grafico

% Plot dell'errore tra il polinomio approssimante e s(x)
figure;  % Crea una nuova figura
plot(x, abs(optimal_px - sx), 'b-');  % Plotta l'errore (valore assoluto della differenza) come linea blu
title('Errore tra il polinomio approssimante e s(x)');  % Imposta il titolo del grafico
legend('Errore');  % Aggiunge una legenda al grafico

%In questo codice, abbiamo:

%Definito le funzioni s(x), r(x) e f(x).
%Generato un insieme di 256 punti in x nell'intervallo [0, 2π].
%Calcolato i valori di f(x) su questi punti.
%Cercato il polinomio di grado da 0 a 20 che minimizza l'errore rispetto a s(x) (calcolato come la norma 2 della differenza).
%Trovato il grado del polinomio che dà l'errore minimo.
%Plottato il polinomio approssimante con f(x), s(x) e l'errore tra il polinomio approssimante e s(x).
