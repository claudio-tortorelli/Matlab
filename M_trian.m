%RISOLUZIONE DI UN SISTEMA LINEARE CON MATRICE TRIANGOLARE
%-------------------------------------------------------
%Scopo: Questo programma risolve un sistema lineare di n equazioni 
%e n incognite in cui la matrice dei coefficienti A ha la proprietà
%per cui aij=0 per ogni j>i (triangolare inferiore) oppure aij=0 per
%ogni j<i (triangolare superiore).
%Input: Una matrice A dei coefficienti del sistema,
%un vettore b di termini noti.
%Output: I vettori x1 e x2 delle soluzioni.
%Note: Il programma prende in input una matrice A quadrata qualsiasi 
%e verifica se è il suo determinante è diverso da 0 (ovvero è non 
%singolare). Se è vero estrae prima la triangolare superiore e poi
%quella inferiore risolvendo il sistema rispettivamente all'indietro 
%e in avanti.
function [x1,x2]=M_trian(A,b)
n=length(b); %ricava i passi dell'iterazione
if det(A)==0 sprintf('%s','Il sistema non ha soluzione unica') %controllo
else
   sprintf('%s','Estrazione matrice triangolare superiore :')
   A_sup=triu(A) %visualizza l'estratta triangolare superiore
   x1(n)=b(n)./A(n,n);
   for i=n-1:-1:1 %risoluzione in indietro 
      x1(i)=(b(i)-(A(i,n:-1:i+1)*x1(n:-1:i+1)))./A(i,i);
      x1=x1(:);
   end;   
   sprintf('%s','Estrazione matrice triangolare inferiore :')
   A_inf=tril(A) %visualizza l'estratta triangolare inferiore
   x2(1)=b(1)./A(1,1);
   for i=2:1:n %risoluzione in avanti
      x2(i)=(b(i)-(A(i,1:1:i-1)*x2(1:1:i-1)))./A(i,i);
      x2=x2(:);
   end;      
end

   
