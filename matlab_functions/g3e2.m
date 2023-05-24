function [] = g3e2(a, b)
% Esercizio di Davide Ferrara, Vitaliy Lyaskovskiy, Antonio Segreto

% Stampa la tabella dei valori delle 4 norme matriciali al variare dell'ordine e realizza il grafico dell'andamento
% le matrici prese in esame sono di Hilbert e di Wilkinson

% parametri in ingresso
% estremi dell'intervallo degli ordini
% a = ordine minimo
% b = ordine massimo

[normHilb, normWilk] = normTable(a, b);

% Stampa la tabella delle norme della matrice di Hilbert
disp(array2table(normHilb(a:b,:), 'VariableNames', {'Norm1', 'Norm2', 'Inf', 'Frobenius'}, 'RowNames', string(a:b)))
% Stampa la tabella delle norme della matrice di Wilkinson
disp(array2table(normWilk(a:b,:), 'VariableNames', {'Norm1', 'Norm2', 'Inf', 'Frobenius'}, 'RowNames', string(a:b)))

% Grafico dell'andamento delle norme
figure;
hold on
plot(a:b, normHilb(a:b, :), a:b, normWilk(a:b, :), "--");
xlabel('Ordine della matrice');
ylabel('Valore della norma');
legend('Norma 1 Hilbert', 'Norma 2 Hilbert', 'Norma infinito Hilbert', 'Norma di Frobenius Hilbert', 'Norma 1 Wilkinson', 'Norma 2 Wilkinson', 'Norma infinito Wilkinson', 'Norma di Frobenius Wilkinson', 'Location', 'northwest');
title('Andamento delle norme matriciali al variare dell’ordine');

hold off