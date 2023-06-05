function [L,U] = test(a)
n = size(a);
for k=1:n-1
    for i=k+1:n
        a(i,k) = a(i,k)/a(k,k); % costruzione matrice L
        for j=k+1:n
            a(i,j) = a(i,j) - a(i,k) * a(k,j); % costruzione matrice U
        end
    end
end
a
L=eye(n)+tril(a,-1);
U=triu(a);
end

