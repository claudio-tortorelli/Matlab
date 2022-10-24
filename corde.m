%RICERCA DELLE RADICI DI UNA FUNZIONE F(X)=0 CON IL METODO Delle corde
%----------------------------------------------------------------------
%SCOPO: ricerca di una radice della funzione f(x). 
%INPUT: f=funzione derivabile con derivata continua definita esternamente 
%all'algoritmo. t1 è l'ascissa dalla quale parte l'algoritmo. k è il
%numero di iterazioni che si vogliono far fare all'algoritmo al massimo.
%OUTPUT: z= radice trovata
%NOTE: Affinchè il metodo sia efficace, x1 deve essere opportuna, 
%in quanto la convergenza del metodo è garantita solo localmente.
%E' stato inserito un controllo sulla convergenza che interrompe la ricerca
%di nuove approssimazioni nel caso in cui se ne rilevino due uguali.

function [z,numcicli]=corde(f,fprimo,maxcicli,x,epsilon);
fx=feval(f,x);%valuta f in x
f1=feval(fprimo,x);%valuta la derivata prima di f in x 
numcicli=1; %contatore
while (numcicli<maxcicli) & [abs(fx)>abs(epsilon*f1)]
   x=x-[fx./f1];%calcola l'approssimazione seguente
   fx=feval(f,x);
   numcicli=numcicli+1;
end
z=x;
if numcicli==maxcicli 
   error('Il metodo non converge nel numero di cicli richiesti')
end
