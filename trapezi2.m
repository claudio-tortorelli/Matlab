%APPROSSIMAZIONE DI INTEGRALI DEFINITI PER UNA FUNZIONE f(x)
%TRAPEZI COMPISITI N=1 N2=NUMERO SOTTOINTERVALLI
%----------------------------------------------------------------
%SCOPO:si utilizzano le formule di quadratura di newton-cotes per
%approssimare l'area sottesa alla funzione f tra a e b.
%INPUT:a e b estremi di integrazione, n2>0 numero sottointervalli
%OUTPUT:val=calcolo della somma delle aree dei trapezi (a,b,f(b),f(a))
%con a,b estremi di ogni sottointervallo.
%NOTE: f è definita esternamente. Con n2=1 si ha il metodo dei 
%trapezi standard.

function val=trapezi2(a,b,n2)
int(1)=-8;int(2)=7;
if (a<int(1)) or (b>int(2))
   sprintf('%s%d%s%d','Gli estremi di integrazione devono essere tra ',int(1),' e ',int(2)');
else
   %calcolo integrale con n=1 in n2 sottointervalli
   lung=max(a,b)-min(a,b);%ampiezza intervallo [a,b]
   dist=lung/(n2);%trova spazio tra ascisse equidistanti
   x=a;
   for i=1:n2+1 %calcola la f nelle ascisse (estremi compresi)
      fxx(i)=f(x);
      x=x+dist;
   end
   fxx(1)=fxx(1)/2; fxx(n2+1)=fxx(n2+1)/2;
   val=((b-a)/n2)*sum(fxx);%calcolo dell'integrale
end   
    
   
  

