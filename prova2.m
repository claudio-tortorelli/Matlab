% HOUSE
% Restituisce in v il vettore di Householder corrispondente 
% al vettore x
% x può essere di qualsiasi dimensione

function v=house(x)
n=length(x);
nx=norm(x);
if nx==0
   v=zeros(n,1);
elseif x(1)>0
   temp=x(1)+nx;
   v(1)=-nx;
   v(2:n)=x(2:n)/temp;
else
   temp=x(1)-nx;
   v(1)=nx;
   v(2:n)=x(2:n)/temp;
end
% HOUSE
% Restituisce in v il vettore di Householder corrispondente 
% al vettore x
% x può essere di qualsiasi dimensione

function v=house(x)
n=length(x);
nx=norm(x);
if nx==0
   v=zeros(n,1);
elseif x(1)>0
   temp=x(1)+nx;
   v(1)=-nx;
   v(2:n)=x(2:n)/temp;
else
   temp=x(1)-nx;
   v(1)=nx;
   v(2:n)=x(2:n)/temp;
end
