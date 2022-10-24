%RISOLUZIONE DI UN SISTEMA LINEARE CON MATRICE TRIANGOLARE (sup)
%---------------------------------------------------------------
%Scopo: questa funzione risolve un sistema lineare di n equazioni 
%e n incognite in cui la matrice dei coefficienti A ha la proprietà
%di essere triangolare (sup o inf) per cui aij=0 per ogni j>i oppure 
%aij=0 per ogni j<i.
%Input: una matrice A dei coefficienti del sistema quadrata triangolare,
%un vettore b di termini noti.
%Output: il vettore delle soluzioni x.
%Note: il programma prende in input una matrice A quadrata triangolare
%superiore qualsiasi. Effettua un controllo per la compatibilità 
%delle dimensioni e risolve il sistema in indietro (A=U).
%Non si effettua nessun controllo sull'esistenza e unicità della 
%soluzione. La soluzione viene riscritta nel vettore b stesso.

function x=M_trianI(U,b)
n=length(b);%ricava la lunghezza di b
if n ~=size(U)
   error('Le dimensioni del sistema sono errate. Funzione abortita')
else
	b(n)=b(n)./U(n,n);%trova la prima incognita
   for i=n-1:-1:1 %risoluzione in avanti per le altre
      b(i)=(b(i)-(U(i,n:-1:i+1)*b(n:-1:i+1)))./U(i,i);%riscrittura in b      	
   end;
end
x=b;
   