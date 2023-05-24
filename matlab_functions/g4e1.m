function [] = g4e1(a, b)
% Esercizio di Davide Ferrara, Vitaliy Lyaskovskiy, Antonio Segreto

% Inizializza una matrice vuota per le norme
[condH,condW] = condTable(a, b);

% Stampa la tabella delle norme della matrice di Hilbert
disp(array2table(condH(a:b,:), 'VariableNames', {'Norm2', 'NormInf'}, 'RowNames', string(a:b)))
% Stampa la tabella delle norme della matrice di Wilkinson
disp(array2table(condW(a:b,:), 'VariableNames', {'Norm2', 'NormInf'}, 'RowNames', string(a:b)))

% Grafico dell'andamento dell'indice di condizionamento
figure
semilogy(a-1:b, condH(:,1), 'r', a-1:b, condH(:,2), 'c', a-1:b, condW(:,1), 'g', a-1:b, condW(:,2), 'b')
title('Indice di condizionamento Hilbert e Wilkinson')
xlabel('Ordine n')
ylabel('Indice di condizionamento')
legend('Norma 2 Hilbert', 'Norma Inf Hilbert', 'Norma 2 Wilkinson', 'Norma Inf Wilkinson')

end

