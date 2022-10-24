%crea un vettore o una matrice random positivo o negativo di ordine 
%rig x col
function x=rndvet(rig,col)
   x=round((50*randn([rig col])));
