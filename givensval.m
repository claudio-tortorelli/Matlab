%CALCOLO DELLE COMPONENTI DELLE MATRICE DI GIVENS E DEL SUO
%VALORE SECONDO STEWART
%----------------------------------------------------------
%SCOPO: dati i due elementi di A di cui il secondo da annullare
%ritorna il valore della matrice di Givens che moltiplicata ad A 
%otterrebbe tale modifica. Il valore è scalare perchè la matrice è
%rappresentata con la tecnica di Stewart.
%INPUT: le due componenti di A.
%OUTPUT: il valore ro della matrice di Givens al passo i-esimo, 
%i due valori di seno e coseno calcolati

function [val,s,c]=givensval(x1,x2);
%trova anzitutto il valore di sin e cos capaci di creare la
%matrice di Givens ad hoc per i valori delle componenti x1 e x2.
%Si usano le formule più stabili.
if x2==0 %se la seconda componente è già nulla...
   c=1;
   s=0;
elseif abs(x2)>=abs(x1) %la seconda è maggiore in val assoluto
   t=x1/x2;
   s=1/sqrt((1+t^2));
   c=s*t;
else %la prima è maggiore in val assoluto
   t=x2/x1;
   c=1/sqrt((1+t^2));
   s=c*t;
end
%adesso si calcola ilo valore riassuntivo della matrice secondo
%le regola di Stewart
if c==0 
   val=1;
elseif abs(s)<abs(c)
   val=0.5*sign(c)*s;
else
   val=(2*sign(s))/c;
end

   


   





      
      
      
      
