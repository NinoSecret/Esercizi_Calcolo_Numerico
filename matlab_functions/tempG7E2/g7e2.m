%{
Questo programma implementa il metodo di Jacobi per risolvere un sistema lineare Ax = b, 
dove A è una matrice eptadiagonale (con 7 diagonali) ma funziona anche in caso di matrice tridiagonale e pentadiagonale. 
Le diagonali di A sono memorizzate nei vettori:
diag_main, diag_upper1, diag_upper2, diag_upper3, diag_lower1, diag_lower2, diag_lower3.

ESEMPIO VETTORI DI A
diag_main = [4, 4, 4, 4, 4];
diag_upper1 = [1, 1, 1, 1];
diag_upper2 = [0.5, 0.5, 0.5];
diag_upper3 = [0.25, 0.25];
diag_lower1 = [1, 1, 1, 1];
diag_lower2 = [0.5, 0.5, 0.5];
diag_lower3 = [0.25, 0.25];
b = [1, 1, 1, 1, 1];
%}
function g7e2(diag_main, diag_upper1, diag_upper2, diag_upper3, diag_lower1, diag_lower2, diag_lower3, b)

% Stampa il risultato
disp(jacobiMethodBanda(diag_main, diag_upper1, diag_upper2, diag_upper3, diag_lower1, diag_lower2, diag_lower3, b))

end