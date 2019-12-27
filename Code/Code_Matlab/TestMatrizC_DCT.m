clc;clear all; close all;
%x=[0.0 0.1 0.3 0.4 0.3 0.2 0.1 0 -0.1 -0.2 -0.3 -0.2 -0.1 0]';
x=[0.2   0.2  0.2  -0.2  -0.2  -0.2  0.2  0.2  0.2 -0.2 -0.2 -0.2]';
N=length(x); n=0:N-1;
% Obtener matriz C
C=MatrizDCT(N);
% Obtener la DCT
X=C'*x;
% Visualizar
m=n;
subplot(2,1,1); stem(n,x); xlabel('n'); ylabel('x(n)');title('Señal x(n)')
subplot(2,1,2); stem(m,X); xlabel('m'); ylabel('X(m)');title('Transformada Coseno')
% Cálculo de la diferencia con la función de Matlab dct()
figure
DCTdif=X-dct(x);
stem(n,DCTdif); xlabel('m'); ylabel('Diferencia');title('X-Xmat'); grid on