% Sistema que calcula iterativamente la raíz cuadrada de un número 0< a <1;
% y(n)=x(n)-y(n-1)^2+y(n-1);
% x(n)=a u(n); donde  0<a<1;
clc;clearvars; close all;

a=0.09; L=10;
x=a*ones(1,L);

% Valor de y(0)
n=0; m=n+1;
y(m)= x(m); % Se asume y(-1)=0;

for n=1:L-1
   m=n+1;
   y(m)=x(m)-y(m-1)*y(m-1)+y(m-1);
   
end
Err_raiz=sqrt(a)-y; %Error en cada iteración;

subplot(2,2,1); stem([0:L-1],x); title( ['x(n)= ' num2str(a) 'u(n) ']); grid on;
subplot(2,2,2); stem([0:L-1],y); title(['y(n)= sqrt(' num2str(a)  ')']);grid on;
subplot(2,2,3:4); stem([0:L-1],Err_raiz); title('Error= x(n)- y(n)');grid on;


