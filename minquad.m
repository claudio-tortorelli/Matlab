%METODO DEI MINIMI QUADRATI
%--------------------------
%SCOPO: dati in input dei punti campionati si cercano i coefficienti
%di un polinomio P(x) di grado n t.c la distanza euclidea di P(x) 
%da f(x) sia minima. 
%INPUT: due vettori di m elementi x e y contenenti le ascisse e
%le ordinate derivate da un certo fenomeno. Il grado n del polinomio
%che deve approssimare ai minimi quadrati i punti campionati.
%OUTPUT: il vettore dei coefficienti del polinomio P(x)
%NOTE: il grado n del polinomio viene aumentato di 1 perchè il numero 
%di incognite (e di colonne di V) parte da 0.

function coef=minquad(x,y,gradoP);
m=length(x);%numero di ascisse campionate
n=gradoP+1; %il grado del polinomio approssimante +1 perchè 
					  %si parte da 0          
%costruzione di V rettangolare matrice del sistema sovradeterminato
app=ones(m,1);%vet per il calcolo delle colonne di V
V=zeros(m,n);%inizializza V a 0 mxn
for i=1:n
   V(1:m,i)=app;%inizializza l'i-esima colonna di V
   app=app.*x;%calcola la colonna successiva
end
[V,coef]=F_QR2(V,y); %tramite la QR si trovano i coeff. di P(x)


