clc; clearvars; close all;
%Señal de entrada
%x=[10 10  10  10 5  5  5  5  1   1   1  1   -3  -3  -3  -3   -8  -8  -8  -8];
x=[5 5 5  -2 -2  7  7 7 5  5  5  7  7  7 ];
[nf,nc]=size(x);
n=0:nc-1;
% Descomposición parte par e impar 
xpar=(x+fliplr(x))/2;
ximpar=(x-fliplr(x))/2;
% Reconstrucción
xrecons=xpar+ximpar;
%Graficación
subplot(2,2,1); stem(n,x); grid on; title('Señal Original')
subplot(2,2,2); stem(n,xpar);grid on; title('Señal Par');
subplot(2,2,3); stem(n,xrecons);grid on; title('Señal Reconstruida');
subplot(2,2,4); stem(n,ximpar); grid on;title('Señal Impar');



