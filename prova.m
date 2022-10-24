%RICERCA DEI COEFFICIENTI DEL POLINOMIO APPROSSIMANTE LA FUNZIONE
%f(x) COL METODO DEI MINIMI QUADRATI
%---------------------------------------------------------------------
%SCOPO: dato un insieme di punti n di campionamento trovare i 
%coefficienti di un polinomio di grado m (<<n) che passi a distanza 
%minima dalla funzione nei punti di campionamento stessi.
%INPUT: m=grado del polinomio,n=numero di ascisse da campionare, n>m
%OUTPUT: a=vettore coefficienti polinomio, x vettore delle ascisse
%dei punti di campionamento e fx relative ordinate, dist=distanza 
%euclidea del polinomio da f
%NOTE:per ragioni pratiche di realizzazione dell'algoritmo si è scelto 
%di incrementare di un'unità i valori m e n in input, considerando 
%anche n0 e m0 compresi negli n e m.
%Non viene fatto nessun controllo se m>n, in tal caso l'algoritmo non
%funziona.

function [a,x,fx,dist]=minquad(m,n)
x=ordinvet(n+1);%crea n ascisse e n ordinate campionate random
fx=f(x);%individua le relative ordinate

%costruisce V (n+1)x(m+1)
for i=1:n+1 %righe
   for j=1:m+1 %colonne
      V(i,j)=x(i)^(j-1);
   end
end
[Q,R]=F_QR(V);%restituisce Q di dim (n+1xn+1) e R dim (n+1xm+1)
g=Q'*fx;%trova il vettore g
g1=g(1:m+1);%lo separa in 2 parti di m+1 e n-m componenti
g2=g(m+2:n+1);
dist=norm(g2).^2; %distanza euclidea del polinomio da f
Rc=R(1:m+1,1:m+1);%estrae da R R cappello di dim (m+1xm+1)
Rc=inv(Rc);%ne trova l'inversa
a=Rc*g1; %m+1 coefficienti di Pm

%calcolo polinomio e grafico
int(1)=-8; int(2)=7;
count=1;
for k=int(1):0.2:int(2) 
   pn=0;
   for i=1:m+1
      pn=pn+a(i)*(k^(i-1));   
   end
   app(count)=pn;%ascisse del polinomio
   xx(count)=k;%ordinate del polinomio 
   count=count+1;
end

%calcolo punti di campionamento col polinomio
for k=1:n+1
   pn=0;
   for i=1:m+1
      pn=pn+a(i)*(x(k)^(i-1));   
   end
   app2(k)=pn;
   xxx(k)=x(k);
end

%grafico
newplot
hold on
plot(x,fx,'r.',xx,app,'b',xxx,app2,'mx'), grid on, box on, zoom on,legend ('punti campion.','polinomio','ascisse polin.');
o=[int(1),int(2),0];l=[0,0,0];
ax=line(o,l);
set(ax,'Color','green')
hold off;

%FATTORIZZAZIONE DI UNA MATRICE A=QR (modificata per matrici 
%rettangolari))
%-----------------------------------------------------------
%SCOPO: Fattorizzare la matrice A in due matrici Q (ortogonale) e
%R triangolare superiore con A non singolare.
%INPUT: Una matrice A qualsiasi
%OUTPUT: Le due matrici Q con Q di dim (nxn) e R (mxm)
%NOTE: Non si esegue un controllo sulla singolarità di A. La %sottofunzione House rimane invariata.

function [Q,R]=F_QR(A);
[n,m]=size(A);%si ricavano i passi dell'algoritmo
Q=eye(n);%si inizializza Q come matrice identità di dim n x n
      
for i=1:m 
   clear v c Qa Qb %ad ogni passo si annullano le variabili usate
   [A(i:n,i),Qa]=prova2(A(i:n,i));%si passa alla funzione House
   									   %l'iesima colonna di A dalla
     									   %iesima componente in giù	
   v(1)=1; v(2:n+1-i)=A(i+1:n,i);%si estrae di nuovo il vettore di H.
   beta(i)=2/norm(v).^2;
     
   %calcolo della matrice Qb:"immersione" di Qa per renderla di dim
   %uguali a quelle di A.
   for j=1:i%pone i primi i elementi della diagonale della matrice
     			%ausiliaria Qb = 1
     	 Qb(j,j)=1;
   end
   for j=i:n%dalla componente diagonale i alla n-esima li pone =
     	 		%ai corrispondenti sulla matrice di Householder iesima
   	Qb(j,j)=Qa(j-i+1,j-i+1);
     	for k=j:n%comprese le altre componenti sulla riga e colonna
        	Qb(j,k)=Qa(j-i+1,k-i+1);
        	Qb(k,j)=Qa(k-i+1,j-i+1);
     	end
   end
   Q=Q*Qb;%moltiplica Qb per la Q al passo i-1 e genera Q al passo i
   	 	 %t.c. dim(Q)=dim(A)=n
   %modifica A al passo i-1 secondo il vettore di householder iesimo
   %e genera A al passo i       
   for j=i+1:m %Nota:lungo le m colonne
     	a=A(i:n,j); %prende i sottodiagonali della colonna j-esima
     	g(j)=v*a;%li moltiplica per il vettore di H 
     	g(j)=g(j)*beta(i);%trova gamma 
   end
   for j=i+1:m
     	A(i,j)=A(i,j)-g(j);
   end
   for k=i+1:n
     	for j=i+1:m
        	A(k,j)=A(k,j)-g(j)*A(k,i);
     	end
   end
end
R=triu(A); %estrae R
 
      
      

   
