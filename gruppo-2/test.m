% Preallotazione
hilbert_cond_1 = zeros(1,9);
hilbert_cond_2 = zeros(1,9);
wilkinson_cond_1 = zeros(1,9);
wilkinson_cond_2 = zeros(1,9);

% Calcolo dell'indice di condizionamento per le matrici Hilbert e Wilkinson
for n = 2:10
    H = hilb(n);
    W = wilkinson(n);
    
    hilbert_cond_1(n-1) = cond(H,2);
    hilbert_cond_2(n-1) = cond(H,'inf');
    wilkinson_cond_1(n-1) = cond(W,2);
    wilkinson_cond_2(n-1) = cond(W,'inf');
end

% Creazione della tabella dei risultati
T = table([2:10]', hilbert_cond_1', hilbert_cond_2', wilkinson_cond_1', wilkinson_cond_2', 'VariableNames', {'n', 'Hilbert Norma 2', 'Hilbert Norma inf', 'Wilkinson Norma 2', 'Wilkinson Norma inf'});

% Stampa della tabella
disp(T)

% Grafico dell'andamento dell'indice di condizionamento
figure
semilogy([2:10], hilbert_cond_1, 'r', [2:10], hilbert_cond_2, 'b')
title('Indice di condizionamento delle matrici di Hilbert')
xlabel('Ordine n')
ylabel('Indice di condizionamento (scala logaritmica)')
legend('Norma 1', 'Norma 2')

figure
semilogy([2:10], wilkinson_cond_1, 'r', [2:10], wilkinson_cond_2, 'b')
title('Indice di condizionamento delle matrici di Wilkinson')
xlabel('Ordine n')
ylabel('Indice di condizionamento (scala logaritmica)')
legend('Norma 1', 'Norma 2')
