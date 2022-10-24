%APPROSSIMAZIONE DELL'AUTOVALORE DOMINANTE DI UNA MATRICE
%METODO DELLE POTENZE
%----------------------------------------------------------------
%SCOPO:Si vuole approssimare il valore dell'autovalore di A in modulo 
%maggiore di tutti gli altri, equivale a determinare il raggio spettrale.
%INPUT:La matrice quadrata di cui calcolare il raggio spettrale, il 
%numero massimo di iterazioni, la tolleranza sotto la quale si 
%accetta l'approssimazione calcolata.
%OUTPUT:il valore dell'autovalore dominante
%NOTE:per u0 si considera la base canonica

function sigma=autovaldom(A,k,tol);
format long;
n=size(A);
%creazione casuale del vettore di innesco u0
for i=1:n
   u(i)=rand(1);
end
y=(u/norm(u))';%prima normalizzazione
u=(A*y);%u1
y=y';%lo porta a colonna
sigma=y*u;%calcola la prima approssimazione
appr=inf;
%inizio iterazioni
count=2;%contatore iterazioni
while (count<=k) & (appr>(tol*sigma))
   y=(u/norm(u)); %normalizzazione   
   u=A*y;%uk
   y=y';
   oldsigma=sigma;
   sigma=y*u;%sigma k
   count=count+1;
   appr=abs(sigma-oldsigma);
end
sprintf('%s%d','L''algoritmo è terminato all''iterazione ',count-1)
