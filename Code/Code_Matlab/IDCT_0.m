clc; clear all; close all;
%X=[0.6  0.0  -0.2  0.0];
X=[0.1890     0.5607   -0.0664 -0.4643  -0.0425  -0.1787...  
   -0.0132     0.0267    0.0105  0.0407    0.0204   -0.0175 ... 
   0.0152   -0.0210];
N=length(X); m=0:N-1;
a=sqrt(2/N)*ones(1,N);a(1)=sqrt(1/N);
x=[];
for n=0:N-1
    temp=0;
    for k=0:N-1
        ang=(n+0.5)*pi*k/N;
        temp=temp+X(k+1)*a(k+1)*cos(ang);
    end
    x(n+1)=temp;
end
% Visualizar 
n=m;
subplot(2,1,1); stem(m,X); xlabel('m'); ylabel('X(m)');title(' X(m) (DCT de x(n) ) '); 
subplot(2,1,2); stem(n,x); xlabel('n'); ylabel('x(n)');title(' Transformada Inversa Coseno')

figure
stem(m,X); xlabel('m'); ylabel('X(m)');title(' X(m) (DCT de x(n))'); grid on


