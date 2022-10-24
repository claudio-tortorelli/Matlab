%crea vettore ordinato di n punti distinti in un intervallo
function [w]=ordinvet(n)

format long;
%inventa n ascisse distinte nell'intervallo [a,b]
int(1)=-8;int(2)=7; %estremi intervallo 
lung=max(int)-min(int);
z=1;%contatore;
while (z<=n) 
   true=0;%bool
   while (true~=1)
      true=1;
      dist=lung*rand(1);
  		x(z)=int(1)+dist;
  		for h=1:z-1
     		if (x(z)<x(h)) & (h~=z)
              tmp=x(h);
              x(h)=x(z);
              x(z)=tmp;
         end      
         if (x(z)==x(h)) & (h~=z)
            true=0;
         end             
      end   
   end   
   z=z+1;   
end


w=x';

