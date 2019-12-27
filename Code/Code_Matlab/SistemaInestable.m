clc;clear all; close all;
% Definición número de muestras
Ns=12; 
% Entrada x(n)=c d(n)
c=0.9;
%c=1.001;
x= c*[1 zeros(1,Ns-1)];
% Salida
yi=0;  %condición inicial y(-1)=0
% evaluando para y(n=0)
y=zeros(1,Ns);
y(1)=yi^2+x(1);
for n=1:Ns-1
   y(n+1)=y(n)^2+x(n+1);
end
n=0:Ns-1;
subplot(2,1,1);
stem(n,x,'LineWidth',2);xlabel('n');ylabel('x(n)');title(['Entrada x(n); c=' num2str(c)]);grid on;
subplot(2,1,2);
stem(n,y,'LineWidth',2);xlabel('n');ylabel('y(n)');title('Salida y(n)');grid on;

