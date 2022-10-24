%Funzioni per esempi
%--------------------------------------------------------
function [y]=f(x);
format long;

%y=(x.^2)-4;%banale

%y=sin(x);

y=-(0.5*x)+atan(x);%simmetrica 

%y=(x.^4)-x; %polinomiale di ordine maggiore

%y=1./(1+x.^2);%runge

%y=(x.^3)-(3.*x).^2-(9.*x)+27;%di molteplicità 3

%y=(4+sin(x).^cos(x)).*x;% irregolare

%y=((x.^3)-1)./exp(x); %asintotica

%y=(sin(x).*x);%periodica

%y=x.^2-((x.^3)./2);

%y=x.^5-5*x.^4+10*x.^3-10*x.^2+5*x-1; 	%piatta vicino alla radice
