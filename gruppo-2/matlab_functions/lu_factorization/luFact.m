function [L,U,P] = luFact(A)
% LU Factorization
% Factorizes A into L*U*P, where A is an n-by-n matrix and P is the permutation matrix
% Returns the lower triangular matrix L, upper triangular matrix U, and permutation matrix P

n = size(A,1);
L = eye(n);
U = A;
P = eye(n);

for k = 1:n-1
    % Partial Pivoting
    [~,p] = max(abs(U(k:n,k)));
    p = p + k - 1;
    if p ~= k
        % Swap rows
        U([k,p],k:n) = U([p,k],k:n);
        P([k,p],:) = P([p,k],:);
        if k > 1
            L([k,p],1:k-1) = L([p,k],1:k-1);
        end
    end
    
    % Compute multipliers and update matrix
    for i = k+1:n
        L(i,k) = U(i,k) / U(k,k);
        U(i,k:n) = U(i,k:n) - L(i,k)*U(k,k:n);
    end
end

end