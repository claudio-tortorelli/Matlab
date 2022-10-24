%FUNZIONE SPLINE AUSILIARIA PER TESTARE SPLINE_FARINI...


%RICERCA DEI COEFFICIENTI DELLA FUNZIONE SPLINE CUBICA NATURALE
%----------------------------------------------------------------
%SCOPO: Trovare i coefficienti della funzione spline cubica 
%naturale interpolante f in n ascisse.
%INPUT:n=numero di ascisse di interpolazione interne all'intervallo
%OUTPUT:M=coefficienti del polinomio spline 
%NOTE: 

function [polinomio]=spline(n);
format long;
xx=round(ordinvet(n)); %vettore di ascisse ordinate e distinte per il calcolo
%della spline e successiva rappresentazione.
%xx=[-8,-7,-4,6];
x(1)=-8;x(n)=7; %estremi intervallo 
fx(1)=f(x(1));fx(n)=f(x(n));%ordinate degli estremi

%determina n ascisse equidistanti nell'intervallo [a,b]
%altrimenti serve modifica con vettore h di dim n contenente
%l'ampiezza di ogni sottointervallo
lung=max(x)-min(x);%lunghezza intervallo
h=lung/(n-1); %distanza costante tra le ascisse (xi-x(i-1))
for g=2:n-1
   x(g)=x(1)+((g-1)*h);%ascisse di interp.
   fx(g)=f(x(g));%i relativi punti campionati
end
polinomio=spline_farini(x,fx,xx);


newplot
plot(x,fx,'-r',xx,polinomio,'b'), grid on, box on, zoom on,legend ('funzione','x(i+1)');
o=[x(1),x(n),0];l=[0,0,0];
ax=line(o,l);
set(ax,'Color','green')
hold off;

