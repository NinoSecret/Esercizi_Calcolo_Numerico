% Creazione di una griglia con 256 punti tra 0 e 2*pi
x = linspace(0, 2*pi, 256)';

% Definizione del segnale s(x) e della funzione rumore r(x)
s = ((x-1.2).*sin(3.*x)+1./(x+1).*sin(1+x.^2)).*sin(x/2);
r = 0.1*sin(7*x)+2*sin(23*x).*cos(31*x).*sin(1-19*x);

% Costruzione del segnale disturbato dal rumore f(x)
f = s + r;

% Gradi dei polinomi da testare
gradi = [1:10];

% Vettore per conservare gli errori
errori = zeros(length(gradi), 1);

% Loop attraverso i gradi dei polinomi
for i = 1:length(gradi)

    % Approssimazione polinomiale del segnale f(x) 
    p = polyfit(x, f, gradi(i));
    
    % Calcola il segnale approssimato
    f_approssimato = polyval(p, x);
    
    % Calcola l'errore tra il segnale originale s(x) e il segnale approssimato
    errori(i) = norm(s - f_approssimato);
    
end

% Trova il grado del polinomio che minimizza l'errore
[min_errore, indice_min] = min(errori);
grado_min = gradi(indice_min);

% Genera il polinomio di migliore approssimazione
p_min = polyfit(x, f, grado_min);
f_approssimato_min = polyval(p_min, x);

% Grafico 1: Segnale approssimato vs f(x)
figure(1);
plot(x, f, 'r.', x, f_approssimato_min, 'b-');
title('Segnale approssimato vs f(x)');

% Grafico 2: Segnale approssimato vs s(x)
figure(2);
plot(x, s, 'r.', x, f_approssimato_min, 'b-');
title('Segnale approssimato vs s(x)');

% Grafico 3: Errore tra il segnale approssimato e s(x)
figure(3);
plot(x, abs(s - f_approssimato_min), 'r-');
title('Errore tra il segnale approssimato e s(x)');

% Tabella degli errori
T = table(gradi', errori, 'VariableNames', {'Grado del Polinomio', 'Norma dell Errore'});
disp(T);

% Stampa il grado del polinomio che minimizza l'errore
fprintf('Il grado del polinomio che minimizza l\\''errore è %d con un errore di %f\n', grado_min, min_errore);
