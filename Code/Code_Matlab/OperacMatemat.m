clc; clearvars; close all;
 
%Se�ales x1(n) y x2(n)
x1=[2  4 3 3 4 5 9 5.6  3.2];
x2= [2 1 10 -2 5 6  7.1  2.3 1.8];
n=0:8;
%Operaciones Matem�ticas
x3=3*x1+4*x2;  %Suma
x4=x1.*x2;  %Multiplicaci�n
x5=x1./x2;  %Divisi�n 
x6=x1.^x2;  % Exponenciaci�n
x7=log(x1)-x2.^2;  %Logaritmo
x8=exp(x1)+x2; %Exponenciaci�n
% Visualizaci�n
 
subplot(2,4,1); stem(n,x1); title('x1(n)');grid on;
subplot(2,4,2); stem(n,x2); title('x2(n)');grid on;
subplot(2,4,3); stem(n,x3); title('Suma');grid on;
subplot(2,4,4); stem(n,x4); title('Multiplicaci�n');grid on;
subplot(2,4,5); stem(n,x5); title('Divisi�n');grid on;
subplot(2,4,6); stem(n,x6); title('Exponenciaci�n');grid on;
subplot(2,4,7); stem(n,x7); title('Logaritmo - Resta');grid on;
subplot(2,4,8); stem(n,x3); title('Exponencial - Suma');grid on;
