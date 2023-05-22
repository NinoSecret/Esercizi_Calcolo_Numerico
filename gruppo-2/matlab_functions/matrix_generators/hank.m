function [H] = hank(c,n,m)
% Matrice di Hankel
% Le matrici di Hankel sono matrici quadrate o rettangolari definite come segue:
% H(i,j)=c(i+j-1) dove c è un vettore es: c = [1, 2, 3, 4, 5, 6];
% Le matrici di Hankel sono interessanti perché sono utilizzate in diverse applicazioni, 
% come la teoria dei segnali e la teoria dei sistemi. 
% In particolare, le matrici di Hankel sono spesso utilizzate per rappresentare sequenze temporali o segnali discreti, 
% dove ogni riga o colonna della matrice rappresenta una misura o un'osservazione in un determinato momento.

% Le matrici di Hankel hanno diverse proprietà interessanti, tra cui:
% Sono simmetriche o anti-simmetriche, a seconda della parità di n e m
% Hanno la stessa diagonale principale e diagonale secondaria, chiamata diagonale di Hankel
% Possono essere decomposte in una somma di matrici di rango 1
% Possono essere utilizzate per risolvere problemi di approssimazione di dati o di identificazione di sistemi.

H=zeros(n,m);

for i=1:n
    for j=1:m
        k=i+j-1;
        if k <= length(c)
            H(i,j)=c(k);
        end
    end
end

end


