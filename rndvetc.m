%crea un vettore o una matrice random positivo di ordine n nei complessi
function x=rndvet(rig,col)
format short;
x=round((100.* rand([rig col])));
for y=1:rig
   for j=1:col
      po=rand(1);
      if po>0.5 
         x(y,j)=x(y,j)+i;
      end
   end
end

