%METODO ITERATIVO DI JACOBI PER LA SOLUZIONE DI UN SISTEMA
%---------------------------------------------------------
%SCOPO: ottenere un'approssimazione adeguata della soluzione del
%sistema di partenza. 
%INPUT: una matrice A non singolare quadrata con elementi diagonali
%diversi da zero, il vettore dei termini noti b, il vettore di 
%innesco, il numero massimo di iterazioni, la tolleranza epsilon.
%OUTPUT: il vettore x delle soluzioni alla j-esima approssimazione
%il numero di iterazioni effettuate.
%NOTE: in questo algoritmo si sceglie di scomporre A in una matrice
%diagonale D, una matrice triangolare superiore stretta U e una 
%inferiore stretta L con N=-L-U e M=D. 

function [x,count]=jacobi(A,b,x,maxiter,epsilon);
n=length(b); 
%si stabilisce il criterio di arresto
soglia=epsilon.*norm(b); %ovvero quando la norma del residuo è < di sup
res=b-A*x;%calcola il residuo al passo 0 (di innesco)
count=1;%inizializza contatore
%comincia ad approssimare la soluzione fin quando il residuo scende
%al di sotto della soglia sup fissata oppure si raggiunge il massimo
%delle iterazioni che si vogliono compiere

while (count<=maxiter) & (norm(res)>soglia)      
   tmp=x;%si prende il vettore delle soluzioni al passo precedente
   		%e lo si riutilizza per calcolare la soluz. attuale
   for i=1:n %aggiorna le componenti della soluzione x
      x(i)=[b(i)-A(i,1:i-1)*tmp(1:i-1)-A(i,i+1:n)*tmp(i+1:n)]/A(i,i);         
   end   
   res=b-A*x;%si calcola il residuo attuale
   count=count+1;%si incrementa il contatore delle iterazioni
end  
if count>maxiter
   sprintf('%s%d%s','L''algoritmo non è teminato entro le ',maxiter,' iterazioni previste.')
   sprintf('Non converge con la tolleranza usata (100*eps)')
end

	