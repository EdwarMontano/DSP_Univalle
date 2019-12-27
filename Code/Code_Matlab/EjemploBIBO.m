clc;clearvars; close all;
Ns=12; % Definición número de muestras
% Entrada x(n)=c d(n)
%c=2.0;
c=0.9;
x= c*[1 zeros(1,Ns-1)];
yi=0;  %condición inicial y(-1)=0
y=zeros(1,Ns);
y(1)=yi^2+x(1); % evaluando para y(n=0)
for n=1:Ns-1
   y(n+1)=y(n)^2+x(n+1);
end
n=0:Ns-1;
subplot(2,1,1);
stem(n,x,'LineWidth',2);xlabel('n');ylabel('x(n)');
title(['Entrada x(n); c=' num2str(c)]);grid on;
subplot(2,1,2);
stem(n,y,'LineWidth',2);xlabel('n');ylabel('y(n)');title('Salida y(n)');grid on;

