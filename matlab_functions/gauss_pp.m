function [detA] = gauss_pp(A)
%GAUSS_PIVOT Summary of this function goes here
n=length(A);
sol = ones(n,1);
b = A*sol;
flag = 1;
detA = 1;
for k = 1:n-1
    % Pivoting
    [piv, l] = max(abs(A(k:n,k)));
    if (l ~= k)
        % Scambio righe
        temp = A(l+k-1,:);
        A(l+k-1,:) = A(k,:);
        A(k,:) = temp;
        tempor = b(l+k-1);
        b(l+k-1) = b(k);
        b(k) = tempor;
        flag=-flag;
    end
    % Algoritmo di Gauss
    for i = k+1:1:n
        mik = A(i,k)/A(k,k);
        A(i,k) = 0;
        for j = k+1:1:n
            A(i,j) = A(i,j) - mik*A(k,j);
            b(i) = b(i) - mik*b(k);
        end
    end
    
    for i=1:n
        detA=detA*A(i,i);
    end
    
end

