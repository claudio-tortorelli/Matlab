%RICERCA DEL POLINOMIO INTERPOLANTE P(X) CON ALGORITMO DI NEVILLE
%----------------------------------------------------------------
%SCOPO: Approssimare la funzione test con un polinomio Pn(x) di 
%grado n (con n dati in input), i cui coefficienti sono da determinare.
%INPUT: Il numero di ascisse dell'intervallo che serviranno a calcolare
%Pn e il punto particolare r dove deve essere valutato Pn  
%OUTPUT: il valore del polinomio in r e il valore esatto della f(r)
%NOTE: La funzione interpolata è definita fuori dell'algoritmo. 

function neville(n,r);
format long;
%inventa n ascisse distinte nell'intervallo [a,b]
int(1)=-8;int(2)=7; %estremi intervallo 
x=ordinvet(n);%estrae il vettore delle ascisse
fx=f(x);%e le relative ordinate della funzione (note)
%matrice triangolare polinomi di grado n
P=tril(zeros(n,n));%crea la matrice triangolare contenente le approssim
						 %della funzione al grado n
for i=1:n %prima colonna della matrice
    P(i,1)=fx(i);
end
 
for i=2:n % tutte le altre calcolare ricorsivamente 
   for j=i:n %per ogni colonna tutte le righe sottodiagonali        
      num=P(j-1,i-1)*(r-x(j))-(P(j,i-1)*(r-x(j-i+1)));
      den=x(j-i+1)-x(j);
      P(j,i)=num/den;
   end
end
polinomioinR=P(n,n)
funzione=f(r)
     
  

    


      