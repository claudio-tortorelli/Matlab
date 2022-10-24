%MEDIA ARITMETICA MODIFICATA
%-----------------------------
%SCOPO E OBIETTIVO:
%Si ipotizza di avere dei dati campionati in un intervallo ristretto
%(es. temperatura atmosferica atmosferica) e si vuol trovare la media
%aritmetica di tutti i valori rilevati istante per istante, senza
%mantenere strutture di archiviazione.
%SOLUZIONE: 
%ho trovato una formula alternativa alla media calcolata classicamente
%(vedi caso 3) data da media_i=media_(i-1)+[(x_i-m_(i-1))/i] con x_i
%uguale all'i-esimo dato campionato e media_i = media di tutti i dati
%campionati fino a quel momento.
%l'ho applicata per ogni dato e il metodo porta al risultato preciso
%ma con un ordine di complessità 3n = caso 1. Nel caso 2 ho invece
%ripristinato la complessità lineare eseguendo il calcolo della media
%ogni 3 dati campionati. Si introduce così un errore relativo che è 
%sensibile al problema della cancellazione numerica se la media è prossima
%allo zero. -> problema! Bisognerebbe limitare tale errore... 
%Inoltre non si presuppone la creazione e la memorizzazione di v.

function [media1,flop1,media2,flop2,errore, media3, flop3] = Media(numDat,max,min);

%Si trovano numDati dati casuali nell'intervallo {max,min}
%e per chiarezza si memorizzano in un vettore anche se sarebbero potuti
%essere passati direttamente all'algoritmo di media uno alla volta
max=round(max);
min=round(min);
numDat=numDat;
v=[numDat,1]';
i = 0;
cifre=length(max);
while (i<numDat)
   x=round(10.*cifre.*randn(1));
   if ([x<max] & [x>min])
      i=i+1;
      v(i)=x;
   end
end

%CASO 1: si applica prima il metodo preciso ad ogni passo (ordine 3n)
flops(0);
media1=v(1);
for i=2:numDat
   %media1=[(i-1)./i].*[media1-v(i)]+v(i);
   media1=media1+[v(i)-media1]./i;
end
flop1=flops;

%CASO 2:si applica il metodo un passo si e uno no
%ordine lineare con errore ~1 
flops(0);
media2=v(1);
%delta=max-min sarebbe una maggiorazione???
for i=1:3:numDat
   %media2=[(i-1)./i].*[media2-v(i)]+v(i); altra versione ma non so come approssimarla
   media2=media2+[v(i)-media2]./i;
end
flop2=flops;
errore=(media2-media1)./media1;

%CASO 3:si applica il metodo solito che però presuppone anche la
%struttura v ordine lineare
flops(0);
media3=sum(v)./numDat;
flop3=flops;

