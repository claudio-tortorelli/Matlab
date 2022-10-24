%DISEGNA GRAFICO
%------------------------------------------------------------
%a estremo sinistro x
%b estremo destro x
%funzione da disegnare
%M matrice con le elaborazioni calcolate da un algoritmo
%1° colonna di M è l'ascissa e 2° colonna l'ordinata 

function grafico(f,a,b,M);
newplot; hold on;
%asse
o=[a,b,0];l=[0,0,0]; ax=line(o,l); set(ax,'Color','green')
asc=(a:0.2:b);
ord=feval(f,asc);
plot(asc,ord,'b'), grid on, box on, zoom on;
plot(M(:,1),M(:,2),'r');
legend ('asse X','funzione','approssimazioni')
hold off; 
