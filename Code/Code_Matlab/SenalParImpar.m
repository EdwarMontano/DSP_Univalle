clc; clearvars; close all;
%Se�al de entrada
%x=[10 10  10  10 5  5  5  5  1   1   1  1   -3  -3  -3  -3   -8  -8  -8  -8];
x=[5 5 5  -2 -2  7  7 7 5  5  5  7  7  7 ];
[nf,nc]=size(x);
n=0:nc-1;
% Descomposici�n parte par e impar 
xpar=(x+fliplr(x))/2;
ximpar=(x-fliplr(x))/2;
% Reconstrucci�n
xrecons=xpar+ximpar;
%Graficaci�n
subplot(2,2,1); stem(n,x); grid on; title('Se�al Original')
subplot(2,2,2); stem(n,xpar);grid on; title('Se�al Par');
subplot(2,2,3); stem(n,xrecons);grid on; title('Se�al Reconstruida');
subplot(2,2,4); stem(n,ximpar); grid on;title('Se�al Impar');



