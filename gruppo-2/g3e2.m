function [] = g3e2(a,b,m,n)





% Stampa la tabella delle norme
disp(array2table(norms(2:15,:), 'VariableNames', {'Norm1', 'Norm2', 'Inf', 'Frobenius'}, 'RowNames', string(2:15)))

% Grafico dell'andamento delle norme
figure;
plot(2:15, norms(2:15, :));
xlabel('Ordine della matrice');
ylabel('Valore della norma');
legend('Norma 1', 'Norma 2', 'Norma infinito', 'Norma di Frobenius', 'Location', 'northwest');
title('Andamento delle norme matriciali al variare dell’ordine');
