 function [x] = norma(a, p) 
 % Funzione per il calcolo della norma 
  
 n=length(a); 
 x=0; 
  
 if isvector(a) 
     switch p 
         case 1 
             for i=1:n 
                 x=x+abs(a(i)); 
             end 
         case 2 
             for i=1:n 
                 x=x+abs(a(i)^2); 
             end 
             x=sqrt(x); 
         case 'inf' 
             for i=1:n
                 w = abs(a(i));
                 if w > x 
                     x=w; 
                 end 
             end 
         otherwise
             for i=1:n
                 x=x+abs(a(i)^p);
             end
             x=x^1/p;
     end 
 else 
     switch p 
 % La norma 1 di una matrice A è definita come il massimo valore assoluto 
 % tra le somme degli elementi di ogni colonna della matrice.          
         case 1 
             for j=1:n 
                 temp=0; 
                 for i=1:n 
                     temp=temp+abs(a(i,j)); 
                 end 
                 if temp > x 
                     x=temp; 
                 end 
             end
        
         case 2
             x=sqrt(max(abs(eig(a'*a))));
         
         case 'fro' 
         % Norma Frobenius
             x=sqrt(trace(a*a'));
         
         case 'inf'
             for i=1:n 
                temp=0; 
                for j=1:n 
                    temp=temp+abs(a(i,j)); 
                end 
                if temp > x 
                     x=temp; 
                end
             end
     end
 end
