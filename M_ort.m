%RISOLUZIONE DI UN SISTEMA LINEARE CON MATRICE ORTOGONALE
%--------------------------------------------------------
%Scopo: questo programma risolve un sistema lineare di n equazioni 
%e n incognite in cui la matrice dei coefficienti A ha la proprietà
%di essere ortogonale ovvero la cui trasposta è uguale all'inversa.
%Input: una matrice ortogonale A dei coefficienti del sistema,
%un vettore b di termini noti.
%Output: il vettore x delle soluzioni.
%Note: anche in questo caso viene fatto un controllo sulla compatibilità
%delle dimensioni. 
function x=M_ort(Q,b)
n=length(b); %ricava i passi dell'iterazione
if n~=size(Q) 
   error('Le dimensioni del sistema sono errate. Funzione abortita')
else
	Qt=Q'; %per il calcolo di x si utilizza la trasposta(=inversa)
	for i=1:1:n %moltiplicazione matrice x vettore
   	x(i)=Qt(i,1:n)*b(1:n);   
	end
   x=x(:);
end





   
