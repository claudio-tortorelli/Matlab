%RICERCA DEL POLINOMIO INTERPOLANTE P(X) NELLA BASE DI NEWTON
%----------------------------------------------------------------------
%SCOPO: Approssimare la funzione test con un polinomio Pn(x) di 
%grado n (con n dati in input), i cui coefficienti sono da determinare.
%INPUT: Il numero di ascisse dell'intervallo che serviranno a costruire
%Pn. Le ascisse vengono poi determinate random sull'intervallo.
%OUTPUT: il grafico del polinomio interpolante, il vettore dei punti
%di interpolazione, il vettore delle differenze divise.
%NOTE: La correzione sull'indice passato alla sottofunzione delle differenze
%divise nel frammento del calcolo delle diff. divise per Horner è dovuta al fatto che
%per necessità implementative l'indice del vettore non poteva partire
%da 0 ma da 1.
%La funzione interpolata è definita fuori dell'algoritmo. 

function [punti,coef]=inter_newton(n);
format long;
%inventa n ascisse distinte nell'intervallo [a,b]
int(1)=-8;int(2)=7; %estremi intervallo 
x=ordinvet(n);%estrae il vettore delle ascisse
fx=f(x);%e le relative ordinate della funzione (note)
%calcolo vettore delle differenze divise
for i=1:n
   c(i)=diff_div(n-i+1,x);   
end
%calcolo polinomio
cont=0;
for r=int(1):0.2:int(2)
   pn=0;
   for i=1:n %algoritmo di Horner
   	pn=c(i)+(r-x(n-i+1))*pn;
   end
   cont=cont+1;
   app(cont)=pn;%vettore delle ordinate dei punti del polinomio
   xx(cont)=r;%vettore delle ascisse 
end
coef=c;%assegna la soluzione
punti=x;

%grafico
newplot; hold on;
asc=(int(1):0.2:int(2));
ord=f(asc);
plot(x,fx,'x',asc,ord,':r',xx,app,'m'), grid on, box on, zoom on;
legend ('punti di interp.','funzione','polinomio')
%asse
o=[int(1),int(2),0];l=[0,0,0]; ax=line(o,l); set(ax,'Color','green')
hold off; 
 
 %sub function per il calcolo delle differenze divise
 %Input: k indice dell'ascissa massima,x vettore dei punti di interp.
 function [val]=diff_div(k,x);
 som=0;
 for i=1:k %indice sommatoria
    den=1;
 	 for j=1:k %indice produttoria
    	if j~=i
        den=den*(x(i)-x(j));
    	end
    end
    som=som+(f(x(i))/den);
 end
 val=som;
 
 

    


      