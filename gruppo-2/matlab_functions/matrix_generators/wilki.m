function [W] = wilki(n)
% Matrice di Wilkinson 
% La matrice di Wilkinson è una matrice quadrata simmetrica tridiagonale 
% che può causare problemi di cancellazione catastrofica in alcuni algoritmi numerici.

% La matrice di Wilkinson di dimensione n è definita come segue:
% Gli elementi sulla diagonale principale sono tutti uguali a n-1
% Gli elementi sulla diagonale immediatamente superiore e inferiore sono tutti uguali a -1
% Tutti gli altri elementi sono uguali a zero.

W=zeros(n);

for i=1:n
    % Diagonale=n-1
    W(i,i)=n-i;
    % Sottodiagonale e sopradiagonale=-1
    W(i+1,i)=-1;
    W(i,i+1)=-1;
end

% Taglio l'ultima colonna della matrice
W=W(1:n,1:n);

end

