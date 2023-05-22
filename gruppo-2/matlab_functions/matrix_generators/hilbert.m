function [H] = hilbert(n)
% Matrice di Hilbert definita come H(i,j) = 1/(i+j-1)
% La matrice di Hilbert ha diverse proprietà interessanti, tra cui:
% E' una matrice simmetrica e positiva definita
% Ha determinante positivo e decresce rapidamente al crescere delle dimensioni
% Ha autovalori che sono tutti positivi, ma diventano rapidamente piccoli al crescere delle dimensioni
% Può causare problemi di stabilità numerica in alcuni algoritmi, come ad esempio il metodo di eliminazione gaussiana.

H=zeros(n);

for i=1:n
    for j=1:n
        H(i,j)=1/(i+j-1);
    end
end

end

