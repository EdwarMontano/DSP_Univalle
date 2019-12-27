clc;clear all; close all;
%X=[0.0 0.1 0.2 0.3 0.4 0.3 0.2 0.1 0 -0.1 -0.2 -0.3 -0.4 -0.3 -0.2 -0.1 0.0]';
X=[0.2   0.2  0.2  -0.2  -0.2  -0.2  0.2  0.2  0.2 -0.2 -0.2 -0.2]';
N=length(X); m=0:N-1;
% Obtener matriz C
C=MatrizDCT(N);
% Obtener la IDCT
x=C*X;
% Visualizar
n=m;
subplot(2,1,1); stem(m,X); xlabel('m'); ylabel('X(m)');title('X(m) (DCT de x(n)')
subplot(2,1,2); stem(n,x); xlabel('n'); ylabel('x(n)');title('Transformada Inversa Coseno')
% Cálculo de la diferencia con la función de Matlab idct()
figure
DCTdif=x-idct(X);
stem(n,DCTdif); xlabel('n'); ylabel('Diferencia');title('x-xmat'); grid on