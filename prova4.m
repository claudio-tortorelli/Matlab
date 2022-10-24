function [A,x]=qr2(A,b)
[m,n]=size(A);

for i=1:n-1
  	A(i:m,i)=prova2(A(i:m,i))';
  	beta(i)=2/([1;A(i+1:m,i)]'*[1;A(i+1:m,i)]);
	for j=i+1:n
      gamma(j)=[1;A(i+1:m,i)]'*A(i:m,j);
      gamma(j)=gamma(j)*beta(i);
  	end
  	for p=i+1:n
    	 A(i,p)=A(i,p)-gamma(p);
  	end
 	for k=i+1:n
   	 for j=i+1:m
        	A(j,k)=A(j,k)-gamma(k)*A(j,i);
     	 end
  	end
end
  
x=b(:);	% Modifica del vettore dei termini noti
for i=1:n-1
  	tmp=beta(i)*[1;A(i+1:m,i)]'*x(i:m);
  	x(i:m)=x(i:m)-tmp*[1;A(i+1:m,i)];
end
