function [x] = backSub(U, b)
% Backward Substitution
% Solves Ux = b, where U is an upper triangular matrix and b is an n-by-1 vector
% Returns the solution x, an n-by-1 vector

n = size(U, 1);
x = zeros(n, 1);

for i = n:-1:1
    x(i) = (b(i) - U(i,i+1:n)*x(i+1:n)) / U(i,i);
end

end