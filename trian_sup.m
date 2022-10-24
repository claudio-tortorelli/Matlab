%risolve un sistema triangolare superiore (all'indietro)
function [x]=trian_sup (U,b);
n=length(b);
x(n)=b(n)./U(n,n);
for i=n-1:-1:1 %risoluzione in indietro 
   x(i)=(b(i)-(U(i,n:-1:i+1)*x(n:-1:i+1)))./U(i,i);
   x=x(:);
end

