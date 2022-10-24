%risolve un sistema triangolare inferiore (in avanti)
function [x]=trian_inf (L,b);
n=length(b);
 x(1)=b(1)./L(1,1);
   	for i=2:1:n %risoluzione in avanti
         x(i)=(b(i)-(L(i,1:1:i-1)*x(1:1:i-1)))./L(i,i);      	
         x=x(:);
      end;      

