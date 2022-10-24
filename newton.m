%RICERCA DELLE RADICI DI UNA FUNZIONE F(x)=0 CON IL METODO DI NEWTON
%-------------------------------------------------------------------
%SCOPO: ricerca di una radice della funzione f(x). 
%INPUT: f=funzione derivabile con derivata fprimo continua definita 
%esternamente all'algoritmo. maxcicli è il numero massimo di
%cicli che si è disposti ad attendere, x è l'ascissa dalla quale 
%parte l'algoritmo, epsilon è la tolleranza sulla soluzione.
%OUTPUT: z= radice trovata, numcicli= numero di iterazioni effettuate
%matappr è la matrice contenente ordinate e ascisse delle approssima-
%zioni trovate.
%NOTE: Affinchè il metodo sia efficace, x deve essere opportuna, 
%in quanto la convergenza del metodo è garantita solo localmente.

function [z,numcicli,matappr]=newton(f,fprimo,maxcicli,x,epsilon);
fx=feval(f,x);%valuta f in x
f1=feval(fprimo,x);%valuta la derivata prima di f in x
numcicli=1; %contatore
matappr(numcicli,1)=x;%colonna ascisse radici
matappr(numcicli,2)=fx;%colonna ordinate radici
while (numcicli<maxcicli) & [abs(fx)>abs(epsilon*f1)]
   x=x-[fx./f1];%calcola l'approssimazione seguente
   fx=feval(f,x);
   f1=feval(fprimo,x);
   numcicli=numcicli+1;
   matappr(numcicli,1)=x;%colonna ascisse radici
   matappr(numcicli,2)=fx;%colonna ordinate radici      
end
z=x;
if numcicli==maxcicli 
   error('Il metodo non converge nel numero di cicli richiesti')
end

   