%RICERCA DEI COEFFICIENTI DELLA FUNZIONE SPLINE CUBICA NATURALE
%----------------------------------------------------------------
%SCOPO: Trovare i coefficienti della funzione spline cubica 
%naturale interpolante f in n ascisse.
%INPUT:n=numero di ascisse di interpolazione interne all'intervallo
%OUTPUT:i valori della spline nelle ascisse di xx 
%M=coefficienti del polinomio spline 
%NOTE: si è preferito implementare direttamente la versione che
%assegna ascisse di interpolazione equidistanti, visto che questa
%è la soluzione più efficiente.

function [polinomio,M]=spline(n);
format long;
xx=ordinvet(n*4); %vettore di ascisse ordinate e distinte per il calcolo
%della spline e successiva rappresentazione.
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
%---------------
for i=2:n-1 %Calcolo della diagonale principale del
   d(i-1)=4*h;	%sistema tridiagonale
end
d2(1:n-3)=h;	% Sottodiagonale
%---------------
for i=2:n-1 % Termini noti
   delta(i-1)=[(fx(i+1)-fx(i))/h]-[(fx(i)-fx(i-1))/h]; 
end
%---------------
M(1)=0; %trova i coefficienti M
M(2:n-1)=tridiag(d,d2,delta); %risolve sistema tridiagonale 
										%per i coefficienti centrali
M(n)=0;
M=M';                              
%---------------
for i=2:n
   C(i)=(fx(i)-fx(i-1))/h-h*(M(i)-M(i-1))/6;	% Calcolo delle
															% costanti Ci e Di
   D(i)=fx(i-1)-(h^2)*M(i-1)/6;
end
%---------------
% Calcolo dei valori che la spline assume in xx
for i=1:4*n %per ogni ascissa di xx
   j=2;
   while xx(i)>x(j) & j<n %ricerca in quale intervallo cade
         j=j+1;
   end
   if j<=n %se non è fuori dell'ultimo intervallo
      pol2=C(j)*(xx(i)-x(j-1))+D(j);
      num=((xx(i)-x(j-1)).^3*M(j)+(x(j)-xx(i)).^3*M(j-1));
      pol(i)=num/(6*h)+pol2;
   end
end
polinomio=pol';%assegna soluzione

newplot
plot(x,fx,':r',xx,polinomio,'b'), grid on, box on, zoom on,legend ('funzione','spline');
o=[x(1),x(n),0];l=[0,0,0];
ax=line(o,l);
set(ax,'Color','green')
hold off;

% TRIDIAG
%---------------------------
%SCOPO: Risolvere il sistema tridiagonale 
%INPUT:p=diagonale principale d, s=vettore sottodiagonale,
%termnot=termini noti ovvero delta
%OUTPUT:x=coefficienti del polinomio spline 

function x=tridiag(p,s,termnot)
n=length(p);
d(1)=p(1);
for i=2:n		% Calcolo L e D ~fattorizzazione LDLt
   l(i)=s(i-1)/d(i-1);
   d(i)=p(i)-s(i-1)*l(i);
end
%-----------
% Risoluzione dei sistemi per ottenere la soluzione finale
alfa(1)=termnot(1);%in avanti
for i=2:n
   alfa(i)=termnot(i)-l(i)*alfa(i-1);
end
%-------------
for i=1:n  %diagonale
   beta(i)=alfa(i)/d(i);
end
%---------
x(n)=beta(n); %in indietro
for i=n-1:-1:1
   x(i)=beta(i)-l(i+1)*x(i+1);		% Soluzione finale
end




