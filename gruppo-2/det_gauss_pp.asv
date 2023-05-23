function [U, deter]=det_gauss_pp(A)
n=size(A,1);
U=A; % INIZIALIZZAZIONI.
deter=1;
for k=1:1:n-1
    [piv, j]=max(abs(A(k:n,k))); % PIVOTING.

    if (piv == 0) % CASO DETERMINANTE 0.
        deter=0;
        return
    end

    if (j ~=1) % SCAMBIO RIGHE.
        temp=A(j+k-1,:);
        A(j+k-1,:)=A(k,:);
        A(k,:)=temp;
        deter=-deter;
    end

    % deter=deter*A(k,k);

    % ELIMINAZIONE GAUSSIANA.

    for index=k+1:1:n
        m(index,k)=A(index,k)/A(k,k);
        A(index,k)=0;
        for j=k+1:1:n
            A(index,j)=A(index,j)-m(index,k)*A(k,j);
        end
    end
end

U=A;
det_U=prod(diag(U)); % CALCOLO DETERMINANTE
% MATRICE FINALE "U".
deter=deter*det_U;