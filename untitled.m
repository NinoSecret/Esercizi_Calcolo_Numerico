a=[4,-1,0;2,7,-2;0,1,5];
n=size(a);
u = [0,0,0];
l = [0,0,0];

% Elemnti diagonale superiore (1 Sommatoria seidel)  
for i=1:n
    for j=i+1:n
        u(j-1) = a(i,j);
    end
end

% Elementi diagonale inferiore (2 Sommatoria seidel)  
for i=1:n
    for j=1:i-1
        l(i-1) = a(i,j);
    end
end

u
l