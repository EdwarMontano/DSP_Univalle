clearvars, close all; clc

a=1.1;

N=30; %N�mero muestras a trazar

n=0:N-1; % Instantes n

x= a.^n; % se�al x(n)

%Polos y Ceros
z=[0 ];
p=[a];
subplot(1,2,1); stem(n,x);grid on;  title('x(n)=a^n u(n)'); xlabel('n');

subplot(1,2,2); zplane(z,p); grid on; 
title('Polos y Ceros)')


