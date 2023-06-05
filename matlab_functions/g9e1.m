function [] = g9e1(grado_max)

% Creazione di una griglia con 256 punti tra 0 e 2*pi
x = linspace(0, 2*pi, 256)';

% Definizione del segnale s(x) e della funzione rumore r(x)
s = ((x-1.2).*sin(3.*x)+1./(x+1).*sin(1+x.^2)).*sin(x/2);
r = 0.1*sin(7*x)+2*sin(23*x).*cos(31*x).*sin(1-19*x);

% Costruzione del segnale disturbato dal rumore f(x)
f = s + r;

% Gradi dei polinomi da testare
gradi = 1:grado_max;

% Vettore per conservare gli errori
errori = zeros(length(gradi), 1);
coeff  = cell(1,grado_max);
f_appr = cell(1,grado_max);
% Loop attraverso i gradi dei polinomi
for i = gradi

    % Approssimazione polinomiale del segnale f(x) 
    coeff{i} = polyfit(x, f, gradi(i));
    % disp(poly2sym(coeff))
    % Calcola il segnale approssimato
    f_appr{i} = polyval(coeff{i}, x);
    
    % Calcola l'errore tra il segnale originale s(x) e il segnale approssimato
    errori(i) = norm(s - f_appr{i});
    
end

% Trova il grado del polinomio che minimizza l'errore
[min_errore, indice_min] = min(errori);
grado_min = gradi(indice_min);

% Genera il polinomio di migliore approssimazione
% coeff_best = coeff{grado_min};
f_appr_best = f_appr{grado_min};

% Grafico 1: Segnale approssimato vs f(x)

figure(1);
hold on;
legend_info = cell(grado_max,1);
for i = gradi
    plot(x, f_appr{i} );
    legend_info{i} =  "Grado " + num2str(i) ;
end
plot(x, f, 'r.', x, f_appr_best, 'b-');
hold off;
legend(legend_info);
title('Segnale approssimato,  f(x)');

% Grafico 2: Segnale approssimato vs s(x)
figure(2);
plot(x, s, 'r.', x, f_appr_best, 'b-');
title('Segnale approssimato, S(x)');

% Grafico 3: Errore tra il segnale approssimato e s(x)
figure(3);
plot(x, abs(s - f_appr_best), 'r-');
title('Errore e S(x)');

% Tabella degli errori
T = table(gradi', errori, 'VariableNames', {'Grado del Polinomio', 'Norma Errore'});
disp(T);

% Stampa il grado del polinomio che minimizza l'errore
fprintf('Il grado del polinomio che minimizza l\''errore è %d con un errore di %f\n', grado_min, min_errore);

end