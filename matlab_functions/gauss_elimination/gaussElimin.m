function [x,U] = gaussElimin(A, b)
% Gauss Elimination without Pivoting
% Metodo di eliminazione di Gauss senza scambio delle righe e perno massimo per risolvere in modo efficiente qualsiasi sistema normale con matrice dei coefficienti non singolare e non avente alcuna speciale struttura.

% O = 1/3 n^3 (pag 23 CN_4_Sistemi_Lineari - leggere pag 32)

n = size(A, 1);

for k = 1:n-1
    if A(k,k) == 0
        disp("La Matrice non è fattorizzabile!")
        return
    end
    for i = k+1:n
        m = - A(i,k) / A(k,k);
        A(i,k) = 0;
        for j = k+1:n
            A(i,j) = A(i,j) + m * A(k,j);
        end
        b(i) = b(i) + m * b(k);
    end
end
U = A;
x = backSub(A, b);

end
