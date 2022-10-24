%CREAZIONE DELLA I-ESIMA MATRICE E VETTORE DI HOUSEHOLDER
%--------------------------------------------------------
%SCOPO: Questo programma ausiliario deve produrre il vettore e 
%la matrice di Householder necessari al passo i-esimo della
%fattorizzazione QR
%INPUT: L'i-esima colonna di A
%OUTPUT: Il vettore v e la matrice Q di Householder al passo i-esimo

function [v,beta]=M_house(v);
n=length(v);
alfa=norm(v); %calcolo della norma del vettore colonna x
if alfa==0 %se la norma è nulla
   v=zeros(n,1)';%il vettore di Householder è nullo 
elseif v(1)>0 %altrimenti si verifica il segno della prima componente 
   gamma=v(1)+alfa; %si trova gamma=1° componente,fattore x normalizzazione
   v(1)=-nx;%immette alfa nella 1° componente del vettore   			
   v(2:n)=v(2:n)/gamma;%inserisce e divide per gamma le altre per normalizzarlo
else
   gamma=v(1)-alfa;%come nell'alternativa precedente ma con norma negativa
   v(1)=nx;
   v(2:n)=v(2:n)/gamma;
end
beta=2/([1,v(2:n)]'*[1;v(2:n)]).^2;
%v=v';%rende v vettore colonna
%calcolo matrice Q
%vnorm(1)=1; vnorm(2:n)=v(2:n);%completa lo scalamento della prima componente
%vnorm=vnorm';%porta il vettore v a colonna
%scalare=norm(vnorm,2).^2;%trova la norma euclidea di scalare=vnorm^T*vnorm
%Q=(vnorm*vnorm');%=vnorm*vnorm^T = matrice
%Q=Q*(2/scalare);
%Q=eye(n)-Q;%I-esima matrice di Householder




      
      
      
      
