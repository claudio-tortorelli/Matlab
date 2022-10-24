%crea una matrice random diagonale dominante positivo di ordine n
%abs(elemento diagonale)>sommatoria abs(tutti gli altri elem della riga)
function A=diagdom(n)
A=round((10.* rand([n])));
for i=1:n
   tot=sum(A(i,1:n));
   A(i,i)=tot+round(10*rand(1));
end

      
   
