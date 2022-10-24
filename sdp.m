%crea un vettore o una matrice random positivo di ordine n
function x=sdp(n)
   x=round((10.* rand([n])));
   x=tril(x);
   x=x*x';
