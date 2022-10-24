%FATTORIZZAZIONE DI UNA MATRICE SDP A=LDLt
%--------------------------------------------------------
%SCOPO: in questo programma si vuole scomporre la matrice quadrata
%sdp A in due matrici: L triangolare inferiore e D diagonale (trovando
%poi Lt per simmetria). In seguito si trova la soluzione del sistema.
%INPUT: una matrice quadrata A dei coefficienti del sistema simmetrica
%e definita positiva (xt*A*x>0 per ogni x di Rn), il vettore dei 
%termini noti.
%OUTPUT: le due matrici della fattorizzazione L,D contenute in A
%e il vettore soluzione in b.
%NOTE: per trovare gli elementi di L e di D si sfruttano due relazioni 
%note dalla teoria ottenute grazie alle proprietà delle matrici SDP.

function [A,b]=F_LDLT(A,b)
n=size(A); %ricava i passi dell'iterazione
%inizio fattorizzazione di A
for i=1:n %per ogni riga   
   for j=1:i-1 %elementi della riga i-esima prima del diagonale
      som=0; %azzera la variabile sommatoria della riga
      for k=1:j-1
         som=som+(A(i,k).*A(k,k).*A(j,k));
      end
      A(i,j)=(A(i,j)-som)./A(j,j);%j-esimo elemento della 
      									 %i-esima riga di L      
   end   
   som=0;
   for k=1:i-1 %sommatoria riga i per elementi diagonali
       som=som+((A(i,k).^2).*A(k,k));
   end
   A(i,i)=A(i,i)-som;%i-esimo elemento della diagonale
end
%risolve i tre sistemi derivati
b=M_trianA(tril(A,-1)+eye(n),b);%L
b=M_diag(diag(diag(A)),b);	%D	
b=M_trianI((tril(A,-1)+eye(n))',b); %L^T
 
      
      

   
