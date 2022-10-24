%RICERCA DELLE RADICI DI UNA FUNZIONE F(x)=0 CON IL METODO DI BISEZIONE
%----------------------------------------------------------------------
%SCOPO: trovare una soluzione dell'equazione f(x)=0 con x appartenente
%ad un intervallo chiuso e limitato [a,b]
%INPUT: f=funzione continua della quale cercare le radici. 
%E' definita esternamente all'algoritmo. a e b sono gli estremi entro
%i quali sarà ricercata la radice. Deve sussistere a<>b. Epsilon è la
%tolleranza sulla soluzione.
%OUTPUT: z= radice trovata, numcicli= iterazioni necessarie a terminare
%matappr= vettore approssimazioni calcolate
%NOTE: affinchè il metodo sia applicabile, per il teorema dell' 
%esistenza degli zeri deve verificarsi la continuità della 
%funzione passata come argomento (non viene fatto nessun controllo). 
%Nel caso in cui la funzione valutata negli estremi dell'intervallo
%di confidenza non abbia segno discorde non è assicurata la 
%convergenza ad una soluzione.

function [c,numcicli,matappr]=bisezione(f,a,b,epsilon);
if a>b %rende gli estremi ordinati in ordine crescente
   tmp=a;
   a=b;
   b=tmp;
end 
fa=feval(f,a);%valuta f in a
fb=feval(f,b);%valuta f in b
numcicli=0;%inizializza il contatore di iterazioni
if fa==0 %controllo banale sugli estremi
   c=a; %La radice è l'estremo a  
   matappr=0;
elseif fb==0
   c=b;%La radice è l'estremo b
   matappr=0;
else %si ricerca la radice interna all'intervallo     
   gamma=ceil(log2(b-a)-log2(epsilon));%si ricava il num max di 
   												%iterazioni
   bool=0; %variabile flag che indica quando l'approssimazione 
           %va sotto la tolleranza delta
   while (numcicli<=gamma) & (bool==0)   
      numcicli=numcicli+1;           
      %delta=tolleranza sul valore della funzione ricavata
      delta=epsilon*abs((fb-fa)/(b-a));
      c=(a+b)/2; %trova il punto medio 
      fc=feval(f,c);
      if abs(fc)<delta 
         bool=1;
         matappr(numcicli,1)=c;%colonna ascisse approssimazioni
			matappr(numcicli,2)=fc;%colonna ordinate approssimazioni			
      else         
      	matappr(numcicli,1)=c;%colonna ascisse approssimazioni
			matappr(numcicli,2)=fc;%colonna ordinate approssimazioni
			if (fc*fa)<0 %sostituisci b con c perchè f(c)>0 (f(a)<0 x def)
            b=c;
            fb=fc;
	      else %altrimenti il contrario
            a=c;
            fa=fc;
         end      
      end   
end

   
   

   
   
   



      
      
      
      
