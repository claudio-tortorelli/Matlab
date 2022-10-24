% SPLINE3
% Calcolo della spline cubica
% x = ascisse
% f = dati campionati
% xtab = intervallo in cui calcolare la spline

function pol=spline3(x,f,xtab)
n=length(x)-1
for i=2:n+1
   h(i)=x(i)-x(i-1);		% Viene calcolata l'ampiezza di ogni
								% intervallino
end
                     
%-------------------
                     
for i=2:n
   d(i-1)=2*(h(i)+h(i+1));		% Calcolo della diagonale principale del
										% sistema tridiagonale
end
d2(1:n-2)=h(3:n);			% Sottodiagonale

d=d'
d2=d2'
%-------------------

for i=2:n
   delta(i-1)=(f(i+1)-f(i))/h(i+1)-(f(i)-f(i-1))/h(i); % Termini noti
end
delta=6*delta;
delta=delta'

%-------------------

M(1)=0;
M(2:n)=tridiagonal(d,d2,delta);
M(n+1)=0;
M=M'
%-------------------
for i=2:n+1
   C(i)=(f(i)-f(i-1))/h(i)-h(i)*(M(i)-M(i-1))/6;	% Calcolo delle
																	% costanti Ci e Di
   D(i)=f(i-1)-((h(i))^2)*M(i-1)/6;
end
C=C'
D=D'
%-------------------
% Calcolo dei valori che la spline assume in xtab
ntab=length(xtab);
j=2;
for i=1:ntab
   while xtab(i)>x(j) & j<n
         j=j+1;
   end
   if j<=n
pol(i)=((xtab(i)-x(j-1)).^3*M(j)+(x(j)-xtab(i)).^3*...
M(j-1))/(6*h(j))+C(j)*(xtab(i)-x(j-1))+D(j);
   end
end

% TRIDIAGONAL
% Risolve il sistema tridiagonale
% a contiene gli elementi della diagonale principale
% b contiene la sottodiagonale
% c contiene i termini noti

function x=tridiagonal(p,s,tnoti)
n=length(p);
d(1)=p(1);
for i=2:n		% Calcolo L e D
   l(i)=s(i-1)/d(i-1);
   d(i)=p(i)-s(i-1)*l(i);
end
l=l'
d=d'
%---------------
% Risoluzione dei sistemi per ottenere la soluzione finale
 
z(1)=tnoti(1);
for i=2:n
   z(i)=tnoti(i)-l(i)*z(i-1);
end
z
%---------------
for i=1:n
   y(i)=z(i)/d(i);
end
y
%---------------
x(n)=y(n);
for i=n-1:-1:1
   x(i)=y(i)-l(i+1)*x(i+1);		% Soluzione finale
end
x
%---------------