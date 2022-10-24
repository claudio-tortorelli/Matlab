%FATTORIZZAZIONE DI UNA MATRICE SDP A=LDLt
%--------------------------------------------------------
%SCOPO: in questo programma si vuole scomporre la matrice quadrata
%sdp A in due matrici: L triangolare inferiore e D diagonale (trovando
%poi Lt per simmetria). In seguito si trova la soluzione del sistema.
%INPUT: una matrice quadrata A dei coefficienti del sistema simmetrica
%e definita positiva (xt*A*x>0 per ogni x di Rn), il vettore dei 
%termini noti.
%OUTPUT: le due matrici della fattorizzazione L,D e il vettore soluzione.
%NOTE: per trovare gli elementi di L e di D si sfruttano due relazioni 
%note dalla teoria ottenute grazie alle proprietà delle matrici SDP.

function [L,D,b]=F_LDLT(A,b)
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
%genera D diagonale
D=eye(n);
for k=1:n
   D(k,k)=A(k,k);
end   
L=tril(A,-1)+eye(n);%ricava L triangolare inferiore
%risolve i tre sistemi derivati
b=M_trianA(L,b);
b=M_diag(D,b);
b=M_trianI(L',b);
 
      
      

   
