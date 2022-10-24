function Q=makeQ(A);
n=length(A);
Q=eye(n);
for i=1:n-1
	v=A(i:n,i);
   v(1)=1;  
	app=eye(n-i+1)-2*(v*v')/(v'*v);
	P=eye(n);
	P(i:n,i:n)=app;
   Q=Q*P;
end;

