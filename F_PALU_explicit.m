%FATTORIZZAZIONE DI UNA MATRICE PA=LU con pivoting parziale
%--------------------------------------------------------
%Scopo: si vuole scomporre la matrice quadrata generica non singolare
%A in due matrici: L triangolare inferiore con la diagonale
%composta da tutti 1, U triangolare superiore. In seguito si risolve
%il sistema dato.
%Input: una matrice A dei coefficienti del sistema non singolare.
%Il vettore b dei termini noti.
%Output: le due matrici della fattorizzazione L e U. Il vettore 
%soluzione x.
%Note: rispetto al precedente algoritmo la condizione necessaria
%al funzionamento è meno restrittiva: la matrice A deve essere solo
%non singolare indipendentemente dal valore degli elementi
%sulla diagonale principale.

function [L,U,b]=F_PALU(A,b)
n=length(diag(A)); %ricava i passi dell'iterazione
for i=1:n-1 
  %si realizza la Pi-esima matrice di permutazione che scambia
  %nell'i-esima colonna di Ai la componente massima in modulo con
  %quella sulla diagonale.
  %confronti tesi a determinare la componente massima sulla colonna
  k=i; %indice attuale
  piv=abs(A(i,i));      
  for j=i+1:n 
      if abs(A(j,i))>piv
         	k=j;
         	piv=abs(A(j,i));
      end
  end   
  if piv==0 
     error('Errore: matrice singolare. Funzione abortita')   
  end
  %scambio di righe 
  v(1,:)=A(i,:);         
  A(i,:)=A(k,:);
  A(k,:)=v(1,:);
  %permutazione per il vettore dei termini noti:
  tmp=b(i); b(i)=b(k); b(k)=tmp;
  %da qui in poi procede con gli stessi passi della LU normale
  A(i+1:n,i)=A(i+1:n,i)/A(i,i); 
  A(i+1:n,i+1:n)=A(i+1:n,i+1:n)-[A(i+1:n,i)*A(i,i+1:n)]; 
  b(i+1:n)=b(i+1:n)-A(i+1:n,i)*b(i);
end
U=triu(A);%si estrae U triangolare superiore da A
L=eye(n)+tril(A,-1);%si estrae L da A con l'accortezza di porre
 						  %gli elementi della sua diagonale=1.	
b=M_trianI(U,b);%risoluzione del nuovo sistema trovato all'indietro  
      

   
