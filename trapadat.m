%APPROSSIMAZIONE DI INTERGRALI DEFINITI PER UNA FUNZIONE f(x)
%METODO COMPOSITO ADATTIVO
%----------------------------------------------------------------
%SCOPO:si utilizzano le formule di quadratura di newton-cotes per
%approssimare l'area sottesa alla funzione f tra a e b. Si imposta 
%una tolleranza sull'errore commesso e finchè non si è raggiunto
%un valore dell'approssimazione al di sotto di questa tolleranza
%l'algoritmo viene richiamato ricorsivamente su intervalli sempre
%più piccoli con tolleranza dimezzata.  
%INPUT:[a,b] estremi di integrazione e tol tolleranza sull'errore
%accettata.
%OUTPUT:val=valore dell'integrale e errore= scarto approssimativo
%tra I(f) e I12(f) in valore assoluto.
%NOTE: 	

function [val,errore]=trapadat(a,b,tol)
h=max(a,b)-min(a,b);%ampiezza intervallo [a,b]
c=a+h/2;%trova punto medio
I1=((h)/2)*(f(a)+f(b));%calcola l'integrale usando il metodo dei
							  %trapezi standard
val=((h)/4)*(f(a)+2*f(c)+f(b));%calcolo dell'integrale col metodo
										 %composito e n=2 sottointervalli		                     
errore=abs(val-I1)/3;%trova la differenza tra i 2 che rappresenta
							%l'approssimazione dello scarto dall'integrale
							%reale
if errore>tol %se l'errore è maggiore della tolleranza richiesta
   [val1,err1]=trapadat(a,c,tol/2);%ripete l'algoritmo sui 2 sotto
   [val2,err2]=trapadat(c,b,tol/2);%intervalli dimezzando la tolleranza
   val=val1+val2;%ricompone il valore dell'integrale e dell'errore
   errore=err1+err2;
end;



