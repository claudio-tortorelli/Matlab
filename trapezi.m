%APPROSSIMAZIONE DI INTEGRALI DEFINITI PER UNA FUNZIONE f(x)
%TRAPEZI N=1
%----------------------------------------------------------------
%SCOPO:si utilizzano le formule di quadratura di newton-cotes per
%approssimare l'area sottesa alla funzione f tra a e b.
%INPUT:a e b estremi di integrazione 
%OUTPUT:val=calcolo dell'area del trapezio (a,b,f(b),f(a))
%NOTE:Si è riportato direttamente il valore di alfa e I in forma già
%semplificata secondo il caso particolare di n=1. f è definita esternamente.
%L'approssimazione avviene tramite un polinomio di grado n=1, ovvero 
%un segmento che unisce f(a) a f(b). L'area sotto questo segmento è 
%appunto un trapezio.

function val=trapezi(a,b)
int(1)=-8;int(2)=7;
if (a<int(1)) or (b>int(2))
   sprintf('Gli estremi di integrazione devono essere tra -8 e 7');
else
   %calcolo alfa i_n
	alfa=[0.5;0.5];
   val=((b-a)/2)*(f(a)+f(b));
   
   %grafico
	count=1;%funzione
	for k=int(1):0.2:int(2) 
      fx(count)=f(k);%ascisse 
      x(count)=k;%ordinate 
   	count=count+1;
   end
   %segmento polinomio grado 1
   c=[a,b];d=[f(a),f(b)];
   %limiti area trapezio
   e=[a,a];g=[0,f(a)];r=[b,b];t=[0,f(b)];q=[a,b];w=[0,0];
	newplot
   hold on
   o=[int(1),int(2),0];l=[0,0,0];
	ax=line(o,l);
	set(ax,'Color','green')
	plot(x,fx,'r',c,d,'b',e,g,'m',r,t,'m',q,w,'m'), grid on, box on, zoom on,legend ('asse','funzione','polinomio','area trapezio');
	hold off;
end

  

