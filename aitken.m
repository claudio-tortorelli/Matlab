%RICERCA DELLE RADICI DI UNA FUNZIONE F(x)=0 CON IL METODO DI AITKEN
%-------------------------------------------------------------------
%SCOPO: ricerca di una radice della funzione f(x). 
%INPUT: f=funzione derivabile con derivata fprimo continua definita 
%esternamente all'algoritmo. maxcicli � il numero massimo di
%cicli che si � disposti ad attendere, x � l'ascissa dalla quale 
%parte l'algoritmo, epsilon � la tolleranza sulla soluzione.
%OUTPUT: z= radice trovata, numcicli= numero di iterazioni effettuate

function [z,numcicli]=aitken(f,fprimo,maxcicli,x,epsilon);
fx=feval(f,x);%primo passo Newton
f1=feval(fprimo,x);
x1=x-[fx./f1];
fx=feval(f,x1);%secondo passo Newton
f1=feval(fprimo,x1);
x2=x1-[fx./f1];
numcicli=1; %contatore
while (numcicli<maxcicli) & [abs(x2-x1)>epsilon]
   x=(x1.^2-x*x2)/(2*x1-x-x2);%applicazione formula di Aitken
   fx=feval(f,x);%primo passo Newton
   f1=feval(fprimo,x);
   x1=x-[fx./f1];
	fx=feval(f,x1);%secondo passo Newton
   f1=feval(fprimo,x1);
   x2=x1-[fx./f1];
   numcicli=numcicli+1;
end
z=x2;%assegna soluzione
if numcicli==maxcicli 
   error('Il metodo non converge nel numero di cicli richiesti')
end

   