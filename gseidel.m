%METODO ITERATIVO DI GAUSS-SEIDEL PER LA SOLUZIONE DI UN SISTEMA
%---------------------------------------------------------------
%SCOPO: ottenere un'approssimazione adeguata della soluzione del
%sistema di partenza. 
%INPUT: una matrice A non singolare quadrata, il vettore dei termini
%noti b, il vettore di innesco e il massimo numero di iterazioni. 
%Epsilon = tolleranza per il criterio di arresto.
%OUTPUT: il vettore x della soluzione approssimata, il numero di
%iterazioni effettuate.
%NOTE: in questo algoritmo si sceglie di scomporre A in L+D+U con
%L (strettamente triangolare inferiore) + D (diagonale)= M e U (stret
%tamente triangolare superiore) = N. 

function [x,count]=gseidel(A,b,x,maxiter,epsilon);
n=length(b);
soglia=epsilon.*norm(b); %ovvero quando la norma del residuo è < di sup
%residuo arbitrario al passo 0 (di innesco)
res=b-A*x;%calcola il residuo al passo 0 (di innesco)
count=1;%contatore delle iterazioni
%comincia ad approssimare la soluzione fin quando il residuo scende
%al di sotto della soglia sup fissata oppure si raggiunge il massimo
%delle iterazioni che si vogliono compiere
while (count<=maxiter) & (norm(res)>soglia)   
   for i=1:n %per tutte le n componenti ad ogni iterazione      
      x(i)=[b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x(i+1:n)]/A(i,i);
   end
   res=b-A*x;%si calcola il residuo attuale
   count=count+1;%si incrementa il contatore delle iterazioni
end
if count>maxiter
   sprintf('%s%d%s','L''algoritmo non è teminato entro le ',maxiter,' iterazioni previste.')
   sprintf('Non converge con la tolleranza usata (100*eps)')
end



	