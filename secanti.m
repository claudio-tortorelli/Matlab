%RICERCA DELLE RADICI DI UNA FUNZIONE F(x)=0 CON IL METODO DELLE SECANTI
%----------------------------------------------------------------------
%SCOPO: ricerca di una radice della funzione f(x). 
%INPUT: f=funzione derivabile con derivata continua definita 
%esternamente all'algoritmo, maxcicli=massimo numero di iterazioni
%che si vogliono attendere, x e x1 =ascisse di innesco, epsilon=
%tolleranza sulla soluzione.
%OUTPUT: z= radice trovata, numcicli= cicli necessari a convergere

function [z,numcicli]=secanti(f,maxcicli,x,x1,epsilon);
fx=feval(f,x);%valuta f in x iniziale
fx1=feval(f,x1);%valuta f in x1 iniziale
alfa=(fx1-fx)/(x1-x);%rapporto incrementale
x2=x1-(fx1/alfa);%nuova approssimazione
fx2=feval(f,x2);%valuta f in x2
numcicli=1; %contatore
while (numcicli<maxcicli) & [abs(fx2)>abs(epsilon*alfa)]
   x=x1;%scala di una posizione i punti per il calcolo della sec.
   x1=x2;
   fx=fx1;%scala anche il valore di f nei punti già calcolati
   fx1=fx2;
	alfa=(fx1-fx)/(x1-x);%rapporto incrementale
	x2=x1-(fx1/alfa);%nuova approssimazione
	fx2=feval(f,x2);%valuta f in x2   
   numcicli=numcicli+1;
end
z=x2;%assegna la soluzione
if numcicli==maxcicli 
   error('Il metodo non converge nel numero di cicli richiesti')
end
