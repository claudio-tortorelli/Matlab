%APPROSSIMAZIONE DELL'AUTOVALORE DOMINANTE DI UNA MATRICE
%METODO DELLE POTENZE
%----------------------------------------------------------------
%SCOPO: data una A quadrata se ne cerca l'autovalore dominante
%e l'autovettore associato.
%INPUT:una matrice quadrata A, il numero massimo di iterazioni, 
%il vettore non nullo u0, la tolleranza sotto la quale si accetta 
%l'approssimazione calcolata.
%OUTPUT:il valore dell'autovalore dominante, l'autovettore associato,
%il numero di iterazioni effettuate.
%NOTE:per u0 si considera la base canonica. Si trova sigma 
%semplificando la formula (6.6)

function [sigma,y,count]=potenze(A,maxiter,u0,tol);
format long;
u0=u0(:); %porta u_0 a colonna
y=(u0/norm(u0));%normalizzazione di u_0
u=(A*y);%u_1 : approssimaz autovettore successivo
y=y';%y è = u_0: lo si inverte per calcolare (u_0)^(-1)
sigma=y*u;%calcola la prima approssimazione:(u_0)^(-1)*u_1
err=tol+1;%si vuol eseguire almeno una iterazione
%inizio iterazioni
count=0;%contatore iterazioni
while (count<=maxiter) & (err>(tol*sigma))
   oldsigma=sigma;%si immagazzina la precedente approssimazione
   y=(u/norm(u)); %normalizzazione autovettore  
   u=A*y;%u_k: calcolo appr seguente autovettore
   y=y';%trasposta dell'autovettore precedente all'attuale
   sigma=y*u;%sigma k=nuova appr autovalore
   err=abs(sigma-oldsigma);%distanza tra 2 appr successive
   count=count+1;
end
y=y(:);%fornisce un autovettore colonna
