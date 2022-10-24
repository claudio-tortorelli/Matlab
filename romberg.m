%APPROSSIMAZIONE DI INTERGRALI DEFINITI PER UNA FUNZIONE f(x)
%METODO DI ROMBERG
%----------------------------------------------------------------
%SCOPO: Approssimare l'area di una funzione f tra a e b tramite il
%calcolo in valori prossimi allo 0 di un polinomio interpolante 
%la funzione g che calcolata per 0 fornisce il valore dell'integrale stesso. 
%INPUT: i due estremi di integrazione [a,b] e il numero di sotto intervalli
%per il polinomio interpolante.
%OUTPUT: il valore dell'integrale
%NOTE:si sfrutta la semplificazione di rappresentare la matrice 
%triangolare con un vettore che viene aggiornato dal basso verso l'alto.
%La funzione f è definita esternamente all'algoritmo. 

function val=romberg(a,b,k);
format long;
%crea vettore T di k+1 elementi che rappresenta la matrice triangolare
%e lo inizializza con i valori di Pi(x) di grado 0 interpolante la
%funzione g in 1:k+1 intervalli: per ogni riga riempita si raddoppia
%il numero di intervalli considerati.
for i=1:k+1
   punti=2^(i-1);
   T(i)=trapezi2(a,b,punti);
end
%applica il metodo ricorsivo di romberg fino al calcolo di T(k+1)
for j=1:k+1%per ogni colonna meno la prima (già calcolata)
   for i=k+1:-1:j+1 %dal basso in alto per ogni colonna
      den=(4^i)-1;
      T(i)=T(i)+[(T(i)-T(i-1))/den];
   end
end
val=T(k+1); 
      
