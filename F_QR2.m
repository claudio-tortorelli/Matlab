%FATTORIZZAZIONE DI UNA MATRICE A=QR (metodo di Householder)
%PER PROCESSARE SISTEMI SOVRADETERMINATI
%-----------------------------------------------------------
%SCOPO: fattorizzare la matrice A in due matrici Q (ortogonale) e
%R triangolare superiore tramite la moltiplicazione di A per opportune 
%matrici ortogonali e simmetriche dette matrici di Householder. 
%risolvere poi il sistema assegnato trovando la soluzione minimizzante.
%INPUT: una matrice A non sing, un vettore dei termini noti.
%OUTPUT: la matrice A contenente R nella parte triangolare superiore
%e i vettori di Househ. in quella inferiore,b=la soluzione del sistema.
%NOTE: si ottiene il risultato senza memoria aggiuntiva.

function [A,b]=QR2(A,b);
[m,n]=size(A);
for i=1:n-1 %per le prime n-1 colonne di A
   A(i:m,i)=M_house(A(i:m,i));%trova il vettore di H e lo inserisce 
   									%nei sottodiagonali della colonna i
   v=A(i:m,i); v(1)=1; %prende il vettore di H normalizzato                             
   com=2/(v'*v);%valore di beta comune per ogni colonna di A^i
   for j=i+1:n %implementa il prodotto di beta per le colonne di
      			%A^i eccetto la prima che si azzera... = P^i
      beta(j)=v'*A(i:m,j)*com;      
   end
   for j=i+1:n %sottrazione di P^i da A^i: i-esima riga
      A(i,j)=A(i,j)-beta(j);
   end
   for k=i+1:m %sottrazione di P^i da A^i: si trova A^(i+1)
      for j=i+1:n
         A(k,j)=A(k,j)-beta(j)*A(k,i);
      end
   end
   tmp=com*v'*b(i:m); %modifica il vettore dei termini noti
   b(i:m)=b(i:m)-tmp*v;  
end
A=triu(A(1:n,1:n));
b=b(1:n);
b=M_trianI(triu(A),b);%fattorizzata A risolve il sistema

