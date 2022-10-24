%FATTORIZZAZIONE DI UNA MATRICE A=QR (metodo di Householder)
%-----------------------------------------------------------
%SCOPO: fattorizzare la matrice A in due matrici Q (ortogonale) e
%R triangolare superiore tramite la moltiplicazione di A per opportune 
%matrici ortogonali e simmetriche dette matrici di Householder. 
%risolvere poi il sistema assegnato.
%INPUT: una matrice A quadrata non sing, un vettore dei termini noti.
%OUTPUT: la matrice A contenente R nella parte triangolare superiore
%e i vettori di Househ. in quella inferiore, la soluzione del sistema.
%NOTE: si ottiene il risultato senza memoria aggiuntiva.

function [A,b]=F_QR(A,b);
[m,n]=size(A);
for i=1:n-1 %per le prime n-1 colonne di A
   A(i:n,i)=M_house(A(i:n,i));%trova il vettore di H e lo inserisce 
   									%nei sottodiagonali della colonna i
   v=A(i:n,i); v(1)=1; %prende il vettore di H normalizzato                             
   com=2/(v'*v);%valore di beta comune per ogni colonna di A^i
   for j=i+1:n %implementa il prodotto di beta per le colonne di
      			%A^i eccetto la prima che si azzera... = P^i
      beta(j)=v'*A(i:n,j)*com;      
   end
   for j=i+1:n%sottrazione di P^i da A^i: i-esima riga
      A(i,j)=A(i,j)-beta(j);
   end
   for k=i+1:n %sottrazione di P^i da A^i: si trova A^(i+1)
      for j=i+1:n
         A(k,j)=A(k,j)-beta(j)*A(k,i);
      end
   end
   tmp=com*v'*b(i:n); %modifica il vettore dei termini noti
   b(i:n)=b(i:n)-tmp*v;  
end
b=M_trianI(triu(A),b);%fattorizzata A risolve il sistema

