%RICERCA DEL POLINOMIO INTERPOLANTE P(X) NELLA BASE DI LAGRANGE
%----------------------------------------------------------------------
%SCOPO: Approssimare la funzione test con un polinomio Pn(x) di 
%grado n (con n dati in input), i cui coefficienti sono da determinare.
%INPUT: Il numero di ascisse dell'intervallo che serviranno a costruire
%Pn. Le ascisse vengono poi determinate random sull'intervallo.
%OUTPUT: il grafico della funzione interpolata, i coef. del polinomio
%in questo caso le fi, i=1..n e le ascisse di interpolazione
%NOTE: le ascisse rispettano la condizione necessaria e sufficiente di essere
%tutte distinte in quanto questo è assicurato dal sottoprogramma ordinvet
%che è stato implementato a parte.
%La funzione interpolata è definita fuori dell'algoritmo. 

function [punti,coef,app2]=inter_lagrange(n);
format long;
%inventa n ascisse distinte nell'intervallo [a,b]
int(1)=-8;int(2)=7; %estremi intervallo 
x=ordinvet(n);%estrae il vettore delle ascisse
fx=f(x);%e le relative ordinate della funzione (note)

%calcolo polinomio
cont=0;
for r=int(1):0.2:int(2)%rappresenta il polinomio, r=ascissa passata
   pn=0;%azzera il valore del polinomio in r
   for i=1:n %fa il calcolo del valore del polinomio in ogni ascissa      
      pn=pn+(fx(i)*Lin(i,n,r,x));      
   end      
   cont=cont+1;
   app(cont)=pn;%vettore delle ordinate dei punti del polinomio
   xx(cont)=r;%vettore delle ascisse 
end 
%grafico
 newplot; hold on;
 asc=(int(1):0.2:int(2));
 ord=f(asc);
 plot(x,fx,'x',asc,ord,':r',xx,app,'m'), grid on, box on, zoom on;
 legend ('punti di interp.','funzione','polinomio')
 %asse
 o=[int(1),int(2),0];l=[0,0,0]; ax=line(o,l); set(ax,'Color','green')
 hold off;
 for r=1:n%calcola il polinomio nelle ascisse date
   pn=0;
   for i=1:n %fa il calcolo del valore del polinomio in ogni ascissa      
      pn=pn+(fx(i)*Lin(i,n,x(r),x));      
   end      
   app2(r)=pn;%vettore delle ordinate dei punti noti      
end 
app2=app2';
coef=fx;%assegna la soluzione
punti=x;


 %sub function per il calcolo Lin
 %Input: x valore dell'ascissa, i indice dell'ascissa particolare, 
 %n grado del polinomio, xi vettore ascisse note.
 %Non si effettuano controlli sulle ascisse 
 %per verificarne la correttezza.
 function [val]=Lin(i,n,x,xi);
 num=1;%calcolo numeratore
 for j=1:n
    if j~=i
       num=num*(x-xi(j));
    end
 end
 den=1;%calcolo denominatore
 for j=1:n
    if j~=i
       den=den*(xi(i)-xi(j));
    end
 end%valore di Lin
 val=num/den;
  


      