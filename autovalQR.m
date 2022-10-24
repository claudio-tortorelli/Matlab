%APPROSSIMAZIONE DEGLI AUTOVALORI DI UNA MATRICE CON IL METODO QR
%----------------------------------------------------------------
%SCOPO:Determinare tramite n iterazioni gli n autovalori di una 
%matrice quadrata A.
%INPUT: Una matrice A e le n iterazioni da applicarvi
%OUTPUT:il vettore degli autovalori
%NOTE: 	

function lambda=autovalQR(A,n);
format long;
tmp=A;%assegna A0
for i=1:n %applica n iterazioni
   [Q,R]=F_QR(tmp);%fattorizza Ai
   tmp=R*Q;%trova Ai+1 e continua ad applicarvi il metodo
end
lambda=diag(tmp);%la diagonale della matrice risultato contiene 
					  %le approssimazioni degli autovalori

%riprova
%k=size(A);
%rip=eye(k);
%for i=1:k
%   rip(i,i)=lambda(3);
%end
%determinante3=det(A-rip)


