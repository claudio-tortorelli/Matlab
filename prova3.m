function pol=minqua(x,f,grado)
n=grado+1;			% Costruzione della matrice rettangolare V
m=length(x);
app=ones(m,1);
V=zeros(m,n);
temp=x(:);
for i=1:n
   V(1:m,i)=app;
   app=app.*temp;
end

% Adesso ho in V la matrice rettangolare

% Devo fattorizzare: V=QR
% utilizzo QR2.M che è l'algoritmo classico di fattorizzazione QR 
% adattato per matrici di dimensione mxn
% La fattorizzazione QR infatti va bene anche per matrici rettangolari

[V,f]=prova4(V,f);
R=triu(V);
R1=R(1:n,1:n);
g1=f(1:n);

% Risoluzione del sistema triangolare superiore

n=length(g1);
pol(n)=g1(n)/R1(n,n);
for i=(n-1):-1:1
   pol(i)=(g1(i)-(R1(i,i+1:n)*(pol(i+1:n)')))/R1(i,i);
end
