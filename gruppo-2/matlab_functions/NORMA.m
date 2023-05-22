function [x] = norma(a, p)
% Funzione per il calcolo della norma

n=length(a);
x=0;

if isvector(a)
    switch p
        case 1
            for i=1:n
                x=abs(x+a(i));
            end
        case 2
            for i=1:n
                x=x+abs(a(i)^2);
            end
            x=sqrt(x);
        case "inf"
            for i=1:n
                if abs(a(i)) > x
                    x=abs(a(i));
                end
            end
    end
else
    switch p
% La norma 1 di una matrice A è definita come il massimo valore assoluto
% tra le somme degli elementi di ogni colonna della matrice.         
        case 1
            for j=1:n
                temp=0;
                for i=1:n
                    temp=temp+abs(a(i,j));
                end
                if temp > x
                    x=temp;
                end
            end
        case 2
            % Norma di Frobenius
            for i=1:n
                for j=1:n
                    x=x+a(i,j)^2;
                end
            end
            x=sqrt(x);
        otherwise
        % Il raggio spettrale di una matrice A 
        % è definito come il massimo valore assoluto tra le somme 
        % degli elementi di ogni riga della matrice. 
            for i=1:n
                temp=0;
                for j=1:n
                    temp=temp+abs(a(i,j));
                end
                if temp > x
                    x=temp;
                end
            end
    end
end

