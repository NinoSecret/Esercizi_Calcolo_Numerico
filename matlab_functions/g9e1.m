function [] = g9e1(grado_max, s, r, x)

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
plot_list=zeros(1, grado_max);

for i = gradi
    if i == indice_min
        plot(x, f_appr_best, 'LineWidth', 2);
        legend_info{i} = "Grado" + grado_min +"(best)";
    else
        plot_list(i)=plot(x, f_appr{i});
        legend_info{i} =  "Grado " + num2str(i) ;
    end
end

plot(x, f, 'r.');

hold off;
legend(legend_info);
title('Polinomi, valori di f(x)');

% Grafico 2: Segnale approssimato vs s(x)

for i = gradi
    figure(i+1);
    %disp(i);
    plot(x, s, 'r.', x, f_appr{i}, 'b-');
    %title('Polinomio grado ', num2str(i), 'segnale s(x)');
    legend('Segnale s(x)','migliore approssimazione')
end

% Grafico 3: Errore tra il segnale approssimato e s(x)
figure(grado_max+1);
plot(x, abs(s - f_appr_best), 'r-');
title('Errore rispetto al segnale s(x)');
legend('Errore')

% Tabella degli errori
T = table(gradi', errori, 'VariableNames', {'Grado del Polinomio', 'Norma Errore'});
disp(T);

% Stampa il grado del polinomio che minimizza l'errore
fprintf('Il grado del polinomio che minimizza l\''errore è %d con un errore di %f\n', grado_min, min_errore);

end