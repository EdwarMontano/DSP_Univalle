clc; clear all; close all;
%x=[0.6  0.0  -0.2  0.0]
x=[0.2  0.4  0.4  0.2]
%x=[0.0 0.1 0.3 0.4 0.3 0.2 0.1 0 -0.1 -0.2 -0.3 -0.2 -0.1 0.0];
N=length(x); n=0:N-1; 
X=[];
%Cálculo de la Transformada Coseno
for m=1:N
    temp=0;
    for k=1:N
        ang=(2*k-1)*(m-1)*pi/(2*N);
        temp=temp+x(k)*cos(ang);
    end
    X(m)=sqrt(2/N)*temp;
end
m=n; X
subplot(2,1,1); stem(n,x); xlabel('n'); ylabel('x(n)');title('Señal x(n)')
subplot(2,1,2); stem(m,X); xlabel('m'); ylabel('X(m)');title('Transformada Coseno')

figure
stem(n,x); xlabel('n'); ylabel('x(n)');title('Señal x(n)'); grid on

