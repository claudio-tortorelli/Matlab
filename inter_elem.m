%RICERCA DEL POLINOMIO INTERPOLANTE P(X) NELLA BASE ELEMENTARE
%----------------------------------------------------------------------
%SCOPO: Approssimare la funzione test con un polinomio Pn(x) di 
%grado n (se n+1 sono i dati in input), i cui coefficienti sono da determinare.
%INPUT: Il numero di ascisse dell'intervallo che serviranno a costruire
%Pn. Le ascisse vengono poi determinate random sull'intervallo.
%OUTPUT: i coefficienti del polinomio interpolante, il grafico della
%funzione.
%NOTE: non viene fatto nessunn controllo sulla matrice di Vandermonde, affinchè 
%le ascisse rispettino la condizione necessaria e sufficiente di essere
%tutte distinte in quanto questo è assicurato dal sottoprogramma ordinvet
%che è stato implementato a parte.
%Se ciò non si verificasse det(V)=0.
%La funzione interpolata è definita fuori dell'algoritmo. 

function [a]=inter_elem(n);
format long;
%inventa n ascisse distinte nell'intervallo [a,b]
int(1)=-8;int(2)=7; %estremi intervallo 
x=ordinvet(n);%estrae il vettore delle ascisse
fx=f(x);%e le relative ordinate della funzione (note)
%creazione matrice di Vandermonde nxn
 for j=1:n
    for k=1:n
       V(j,k)=x(j).^(k-1);
    end;
 end; 
 %fattorizzazione della matrice PA=LU 
 [L,U,coef]=F_PALU2(V,fx);%la soluzione è il vettore dei coefficienti di Pn
  cont=0;
 for r=int(1):0.2:int(2)%rappresenta il polinomio (di grado n-1)
    	pn=coef(1);
    	for g=2:n %fa il calcolo del valore del polinomio in ogni ascissa
       	pn=pn+((r^(g-1))*coef(g));
      end
      cont=cont+1;
      app(cont)=pn;%vettore delle ordinate dei punti noti
      ok(cont)=r;
 end 
 %grafico
 newplot; hold on;
 asc=(int(1):0.2:int(2));
 ord=f(asc);
 plot(x,fx,'x',asc,ord,':r',ok,app,'m'), grid on, box on, zoom on;
 legend ('punti di interp.','funzione','polinomio')
 %asse
 o=[int(1),int(2),0];l=[0,0,0]; ax=line(o,l); set(ax,'Color','green')
 hold off;
 a=coef;%assegna la soluzione
 x
 fx
 for r=1:n%calcola il polinomio nelle ascisse date
    	pn=coef(1);
    	for g=2:n %fa il calcolo del valore del polinomio in ogni ascissa
       	pn=pn+((x(r)^(g-1))*coef(g));
      end
      app2(r)=pn;%vettore delle ordinate dei punti noti      
 end 
 app2=app2' 
 
 
  

      