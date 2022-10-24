%APPROSSIMAZIONE DI INTEGRALI DEFINITI PER UNA FUNZIONE f(x)
%SIMPSON N=2 N2=NUMERO SOTTOINTERVALLI
%----------------------------------------------------------------
%SCOPO:si utilizzano le formule di quadratura di newton-cotes per
%approssimare l'area sottesa alla funzione f tra a e b con n=2.
%INPUT:a e b estremi di integrazione, n2>0 =numero 
%sottointervalli [a,b]. 
%OUTPUT:val=calcolo della somma delle aree sottesa alla parabola interpolante 
%le ascisse (x0,x1,x2) tra a e b con a,b estremi di ogni sottointervallo
%NOTE:f è definita esternamente.

function val=simpson(a,b,n2)
int(1)=-8;int(2)=7;
if (a<int(1)) or (b>int(2))
   sprintf('Gli estremi di integrazione devono essere tra -8 e 7');
else
   lung=max(a,b)-min(a,b);%ampiezza intervallo [a,b]
   dist=lung/(n2);%trova spazio tra ascisse equidistanti
   x=a;   
   for i=2:n2 %calcola la f nelle ascisse (estremi compresi)
      if mod(i,2)==0 %determina se in posizione pari o dispari
         x=x+dist;
         fxx(i)=4*f(x);%trova l'ordinata relativa all'ascissa         
      else
         x=x+dist;
         fxx(i)=2*f(x);
      end
   end      
   fxx(1)=f(a);fxx(n2+1)=f(b);%le ordinate degli estremi
   val=((b-a)/(3*n2))*sum(fxx);%calcolo dell'integrale
end