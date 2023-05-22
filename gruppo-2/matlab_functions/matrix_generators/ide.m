function [I] = ide(A)
% Calcolo matrice identica 
% Funzione per calcolare la matrice identica

n = length(A);

for i=1:n
    for j=1:n
        A(i,j) = 0;
    end
A(i,i) = 1;
end

I = A;

end

