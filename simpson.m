%APPROSSIMAZIONE DI INTEGRALI DEFINITI PER UNA FUNZIONE f(x)
%SIMPSON N=2
%----------------------------------------------------------------
%SCOPO:si utilizzano le formule di quadratura di newton-cotes per
%approssimare l'area sottesa alla funzione f tra a e b con n=2.
%INPUT:a e b estremi di integrazione 
%OUTPUT:val=calcolo dell'area sottesa alla parabola interpolante le
%ascisse (x0,x1,x2) tra a e b.
%NOTE:Si è riportato direttamente il valore di alfa e I in forma già
%semplificata secondo il caso particolare di n=2. f è definita esternamente.

function val=simpson(a,b)
int(1)=-8;int(2)=7;
if (a<int(1)) or (b>int(2))
   sprintf('Gli estremi di integrazione devono essere tra -8 e 7');
else
   %calcolo alfa i_2
   alfa=[1/3;4/3;1/3]; %i tre valori di alfa(0,1,2) secondo le formule
   						  %di quadratura
   val=((b-a)/6)*(f(a)+4*f((a+b)/2)+f(b));   
   %grafico (non strettamente inerente all'algoritmo)
	count=1;%funzione
	for k=int(1):0.2:int(2) 
   	fx(count)=f(k);%ascisse 
      x(count)=k;%ordinate 
      count=count+1;
   end
   %---polinomio grado 2
   lung=max(a,b)-min(a,b);
   c=a+(lung/2);%ascissa centrale
   xx=[a,c,b];%ascisse di interpolazione
   fxx=f(xx)';
   %creazione matrice di Vandermonde 3x3
 	for j=1:3
      for k=1:3
      	 V(j,k)=xx(j).^(k-1);
    	end;
   end; 
   %fattorizzazione della matrice PA=LU     
 	[L,U,coef]=F_PALU2(V,fxx);%la soluzione è il vettore dei coefficienti di Pn
  	cont=0;
 	for r=int(1):0.2:int(2)%rappresenta il polinomio (di grado n-1)
   	pn=coef(1);
    	for g=2:3 %fa il calcolo del valore del polinomio in ogni ascissa
       	pn=pn+((r^(g-1))*coef(g));
      end
   	cont=cont+1;
   	app(cont)=pn;%vettore delle ordinate dei punti noti
   	ok(cont)=r;%ascisse
   end
   %----   
   %limiti area
   e=[a,a];g=[0,f(a)];r=[b,b];t=[0,f(b)];q=[a,b];w=[0,0];
   
   newplot
   hold on
   o=[int(1),int(2),0];l=[0,0,0];
	ax=line(o,l);
	set(ax,'Color','green')
	plot(x,fx,'r',ok,app,'b',e,g,'m',r,t,'m',q,w,'m'), grid on, box on, zoom on,legend ('asse','funzione','polinomio','area sottesa');
	hold off;
end

  

