%RISOLUZIONE DI UN SISTEMA LINEARE CON MATRICE TRIANGOLARE (inf)
%---------------------------------------------------------------
%Scopo: questa funzione risolve un sistema lineare di n equazioni 
%e n incognite in cui la matrice dei coefficienti A ha la proprietà
%di essere triangolare (sup o inf) per cui aij=0 per ogni j>i oppure 
%aij=0 per ogni j<i.
%Input: una matrice A dei coefficienti del sistema quadrata triangolare,
%un vettore b di termini noti.
%Output: il vettore delle soluzioni x.
%Note: il programma prende in input una matrice A quadrata triangolare
%inferiore qualsiasi. Effettua un controllo per la compatibilità 
%delle dimensioni e risolve il sistema in avanti (A=L).
%Non si effettua nessun controllo sull'esistenza e unicità della 
%soluzione. La soluzione viene riscritta sullo stesso vettore b.

function x=M_trianA(L,b)
n=length(b);%ricava la lunghezza di b
if n ~=size(L)
   error('Le dimensioni del sistema sono errate. Funzione abortita')
else
	b(1)=b(1)./L(1,1);%trova la prima incognita
   for i=2:n %risoluzione in avanti per le altre
      b(i)=(b(i)-(L(i,1:i-1)*b(1:i-1)))./L(i,i);%riscrittura in b      	
   end;
end
x=b;
   