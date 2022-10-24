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

function [media1,flop1,media2,flop2,errore, media3, flop3] = Media2(numDat,max,min);

%Si trovano numDati dati casuali nell'intervallo {max,min}
%e per chiarezza si memorizzano in un vettore anche se sarebbero potuti
%essere passati direttamente all'algoritmo di media uno alla volta
max=round(max);
min=round(min);
i = 0;
flop1= 0;
flop2=0;
flop3= 0;
somma=0;
media1=0;
media2=0;
media3=0;
cifre=length(max);
while (i<numDat)
   xi=round(10.*cifre.*randn(1));
   if ([xi<max] & [xi>min])
      i=i+1;
      
      %CASO 1: si applica prima il metodo preciso ad ogni passo 
      %(ordine 3n)
		flops(0);
   	media1=media1+[xi-media1]./i;
		flop1=flop1+flops;

		%CASO 2:si applica il metodo un passo si e due no
		%ordine lineare con errore
		flops(0);
      if [(mod(i,3)) == 0] 
         media2=media2+[xi-media2]./i;
      end      
		flop2=flop2+flops;
		
		%CASO 3:si applica il metodo solito 
		%ordine 2n (perchè non memorizza le xi)
      flops(0);
      somma=somma+xi;
		media3=somma./i;
		flop3=flop3+flops;
	end
end
errore=(media2-media1)./media1;
