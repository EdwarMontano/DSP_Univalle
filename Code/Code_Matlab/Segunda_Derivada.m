% Sistema que calcula iterativamente la Derivada de una se�al
% y(n)=x(n+1)-2x(n)+x(n-1);

clc;clearvars; close all;
L=50; % muestras a visualizar

% Se�al r (escal�n)
A=2; 
r=A*ones(1,L+1);

% Se�al r (exponencial)
%  a=0.9;
%  r=a.^([1:L+1]);

%Se�al r (rampa)
r=1:L+1; 


% Se�al procesada a una potencia
x=r.^2;

% Valor de y(0)
n=0; m=n+1;
y(m)= x(m); % Se asume y(-1)=0;

for n=1:L-1
   m=n+1;
   y(m)=x(m+1)-2*x(m)+x(m-1);
   
end


subplot(2,2,1); stem(r); title('r(n)'); grid on;

subplot(2,2,2); stem(x); title('x(n)');grid on;

subplot(2,2,3:4); stem(y); title('y(n) Derivada Segunda de x(n)');grid on;



