%RISOLUZIONE DI UN SISTEMA LINEARE CON MATRICE DIAGONALE
%-------------------------------------------------------
%Scopo: Questo programma risolve un sistema lineare di n equazioni 
%e n incognite.
%Input: Una matrice A diagonale dei coefficienti del sistema,
%un vettore b di termini noti.
%Output: Il vettore x della soluzione.
%Note: Per non appesantire il calcolo si è tralasciato il controllo
%su A per verificare che sia effettivamente diagonale con elementi
%diagonali non nulli. Se ciò non è vero il sistema ha infinite soluzioni.
%Viene fatto invece un controllo sulle dimensioni della matrice e del
%vettore dei termini noti, che devono essere compatibili.

function x=M_diag(A,b)
n=length(b);%estrae la dimensione di b
if size(A)~=n %controlla che le dim di A e b siano compatibili
   error ('Le dimensioni del sistema sono errate. Funzione abortita.');
else 
   for i=1:n %trova il valore di ogni incognita  
      b(i)=b(i)/A(i,i);
   end;
   x=b;
end
