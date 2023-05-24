function [outputArg1,outputArg2] = g4e1(a, b)
% Esercizio di Davide Ferrara, Vitaliy Lyaskovskiy, Antonio Segreto

% parametri in ingresso
% estremi dell'intervallo degli ordini
% a = ordine minimo
% b = ordine massimo

% Inizializza una matrice vuota per le norme
condH = zeros(b, 2);
condW = zeros(b, 2);

% Calcolo delle norme
for n = a:b
    
    % Calcola le quattro norme della matrice
    
    A=hilb(n);
    B=wilki(n);

    % 1. Norma 2
    condH(n, 1) = cond(A, 2);%norma(A,2)*norma(inv(A), 2);
    condW(n, 1) = cond(B, 2);%norma(B,2)*norma(inv(B), 2);

    % 2. Norma infinito
    condH(n, 2) = cond(A, 'inf');%norma(A,'inf')*norma(inv(A),'inf');
    condW(n, 2) = cond(B, 'inf');%norma(B,'inf')*norma(inv(A),'inf');

end

% Stampa la tabella delle norme della matrice di Hilbert
disp(array2table(condH(a:b,:), 'VariableNames', {'Norm2', 'NormInf'}, 'RowNames', string(a:b)))
% Stampa la tabella delle norme della matrice di Wilkinson
disp(array2table(condW(a:b,:), 'VariableNames', {'Norm2', 'NormInf'}, 'RowNames', string(a:b)))

% Creazione della tabella dei risultati
%T = table([2:10]', hilbert_cond_1', hilbert_cond_2', wilkinson_cond_1', wilkinson_cond_2', 'VariableNames', {'n', 'Hilbert Norma 2', 'Hilbert Norma inf', 'Wilkinson Norma 2', 'Wilkinson Norma inf'});

% Stampa della tabella
%disp(T)

% Grafico dell'andamento dell'indice di condizionamento
figure
semilogy(a-1:b, condH(:,1), 'r', a-1:b, condH(:,2), 'b', a-1:b, condW(:,1), 'g', a-1:b, condW(:,2), 'c')
title('Indice di condizionamento delle matrici di Hilbert e Wilkinson')
xlabel('Ordine n')
ylabel('Indice di condizionamento (scala logaritmica)')
legend('Norma 2 Hilbert', 'Norma Inf Hilbert', 'Norma 2 Wilkinson', 'Norma Inf Wilkinson')

end

