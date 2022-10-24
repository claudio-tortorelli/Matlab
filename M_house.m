%CREAZIONE DELLA I-ESIMO VETTORE DI HOUSEHOLDER
%--------------------------------------------------------
%SCOPO: questo programma ausiliario deve produrre il vettore 
%di Householder necessari al passo i-esimo della fattorizzazione QR
%INPUT: L'i-esima colonna di A dalla i-esima componente in poi
%OUTPUT: Il vettore v di Householder al passo i-esimo

function v=M_house(v);
n=length(v);
nrm=norm(v);%trova la norma del vettore passato
if nrm==0 %nel caso la norma sia nulla il vettore di H è nullo
   v=zeros(n,1);
elseif v(1)>0 %si va a vedere il segno della prima componente e se
   			  % è diversa da 0
   tmp=v(1)+nrm;
   v(1)=-nrm;
else
   tmp=v(1)-nrm;
   v(1)=nrm;
end
	v(2:n)=v(2:n)/tmp;%si dividono per gamma le altre componenti










      
      
      
      
