%FATTORIZZAZIONE DI UNA MATRICE A=QR COL PROCEDIMENTO DI GIVENS
%E SUCCESSIVA RISOLUZIONE DEL SISTEMA 
%--------------------------------------------------------------
%SCOPO: fattorizzare la matrice A in due matrici Q (ortogonale) e
%R triangolare superiore con A non singolare. Successivamente si
%risolve il sistema all'indietro.
%INPUT: una matrice A quadrata non singolare, il vettore b dei
%termini noti
%OUTPUT: la matrice A contenente nella parte triangolare superiore
%R e nella parte strettamente triangolare inferiore i valori 
%riassuntivi delle matrici di Givens secondo Stewart utilizzati
%per azzerare le componenti di A selezionate. Si restituisce 
%in b la soluzione del sistema. 
%NOTE: l'algoritmo non fa uso di memoria aggiuntiva rispetto a quella
%usata per il sistema originale

function [A,b]=QRgivens(A,b);
[m,n]=size(A);%si ricavano i passi dell'algoritmo
for j=1:n %per ogni colonna di A
   for i=n:-1:j+1 %per ogni componente sottodiagonale delle colonna j
      				%considerandole dal basso in alto
     x1=A(i-1,j);%prima componente
     x2=A(i,j);%seconda componente
     if x2~=0 %se la seconda componente non è già zero
        [ro,s,c]=givensval(x1,x2);
     	  A(i-1,j)=c*x1+s*x2;%si modifica la prima componente
      							%x1=[x1 x2]*[c;s]	
        A(i,j)=ro; %si accumula il valore della matrice nella 2°
      	   		 %che sarebbe azzerata                   	      
        for k=j+1:n %per tutte le componenti di A oltre la diagonale
      	   		  %delle due righe contenenti gli elementi modificati	             
            t1=c*A(i-1,k)+s*A(i,k);%nuovo val prima componente
            t2=(-s)*A(i-1,k)+c*A(i,k);%nuovo val seconda componente
            A(i-1,k)=t1;
            A(i,k)=t2;
        end      
        %moltiplicazione della matrice di G. anche per b
        b1=b(i-1);
        b2=b(i);
        b(i-1)=c*b1+s*b2;
        b(i)=-s*b1+c*b2;      
     end     
   end   
end
%si risolve il sistema associato
b=M_trianI(A,b);







      
      
      
      
