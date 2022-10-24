%crea un vettore o una matrice random positivo di ordine n
function x=rndvet(rig,col)
   x=round((100.* rand([rig col])));
