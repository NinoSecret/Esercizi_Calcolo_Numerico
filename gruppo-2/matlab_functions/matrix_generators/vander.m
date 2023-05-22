function [V] = vander(x)
% Matrice di Vandermonde
% Le matrici di Vandermonde sono matrici rettangolari definite come segue:
% V(i,j) = x_i^(j-1)

n=length(x);
V=zeros(n);

for i=1:n
    for j=1:n
        V(i,j)=x(i)^(j-1);
    end
end

end

