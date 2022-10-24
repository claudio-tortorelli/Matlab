%FATTORIZZAZIONE DI UNA MATRICE A=LU E RISOLUZIONE SISTEMA
%---------------------------------------------------------
%Scopo: in questo programma si vuole scomporre la matrice quadrata
%generica A in due matrici: L triangolare inferiore con la diagonale
%composta da tutti 1, U triangolare superiore. In seguito si risolvono
%i due sistemi derivati.
%Input: una matrice A quadrata dei coefficienti del sistema, il vettore 
%b dei termini noti.
%Output: Le due matrici della fattorizzazione L e U e la soluzione.
%Note: il controllo sulla compatibilità delle dimensioni viene fatto
%nella funzione M_trianI. Viene fatto un controllo sui minori principali
%di A: nel caso in cui si trovi un elemento pivotale minore in val assoluto
%della precisione di macchina allora è considerato nullo.

function [L,U,b]=F_LU(A,b)
flops(0);
n=length(diag(A)); %ricava i passi dell'iterazione
for i=1:1:n-1 %l'algoritmo si svolge in n-1 passi lungo la diagonale
   %si controlla la condizione necessaria e sufficiente:
   %ogni minore principale di A deve essere non nullo per poter 
   %costruire l'iesimo vettore elementare di Gauss
   if abs(A(i,i))<eps 
      error('La condizione nec. e suff. non è rispettata. Funzione abortita');
   end
   %si va a creare la A del passo seguente ignorando la prima
   %riga e la prima colonna di A attuale, che non incidono sulla
   %fattorizzazione
   A(i+1:n,i)=A(i+1:n,i)/A(i,i); %inserisce nei sottodiagonali
      									 %dell'i-esima colonna di A 
       									 %l'iesimo vettore di Gauss
   A(i+1:n,i+1:n)=A(i+1:n,i+1:n)-[A(i+1:n,i)*A(i,i+1:n)]; 
                             		%Trova la matrice elementare di
     										%Gauss e A al passo i+1		                            
   %il vettore dei termini noti viene aggiornato
   b(i+1:n)=b(i+1:n)-A(i+1:n,i)*b(i);
end
U=triu(A);%si estrae U triangolare superiore da A
L=eye(n)+tril(A,-1);%si estrae L da A con l'accortezza di porre
 						  %gli elementi della sua diagonale=1.	
b=M_trianI(U,b);%risoluzione del nuovo sistema trovato all'indietro          
                     

   
      
      

   
