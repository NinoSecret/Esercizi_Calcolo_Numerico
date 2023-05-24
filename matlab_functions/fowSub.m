function [x] = fowSub(L, b)
% Forward Substitution
% Solves Lx = b, where L is a lower triangular matrix and b is an n-by-1 vector
% Returns the solution x, an n-by-1 vector

n = length(b);
x = zeros(n, 1);

for i = 1:n
    x(i) = (b(i) - L(i,1:i-1)*x(1:i-1)) / L(i,i);
end

end