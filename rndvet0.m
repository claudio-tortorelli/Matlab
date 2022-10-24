%crea un vettore o una matrice random positivo di ordine n
function x=rndvet0(rig,col)

x=round((100.* rand([rig col])));
for i=1:rig
   for j=1:col
      y=rand;
      if y>0.50 x(i,j)=0;
      end
   end
end


