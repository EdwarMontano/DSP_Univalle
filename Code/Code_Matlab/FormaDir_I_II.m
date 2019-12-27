clc; clear all; close all;

% Par�metros Sistema
a1=0.2; 
b0=0.2;
b1=0.3;

% Instantes de evaluaci�n
L=25;
n=0:L-1;

% Se�al de entrada
a=0.5;
x=a.^n;

% Forma Directa I
y1i=0.5; % Condici�n inicial
y1=zeros(1,L); %Definici�n vector
v=zeros(1,L);
% Calculo valor y1(0)
tic  %inicio medici�n tiempo
v(0+1)=b0*x(0+1)+b1*0; %x(-1)=0
y1(0+1)=-a1*y1i+v(0+1);

for i=1:L-1
    m=i+1;
    v(m)=b0*x(m)+b1*x(m-1);
    y1(m)=-a1*y1(m-1)+v(m);
end
t1=toc;

% Forma Directa II
y2i=0.5; % y2(-1), Condici�n inicial
wi= a1*y2i/(a1*b0-b1); %w(-1)
y2=zeros(1,L); % Definici�n vector
w=zeros(1,L);
% C�lculo valor y2(0)
tic  %inicio medici�n tiempo
w(0+1)=-a1*wi+x(0+1); 
y2(0+1)=b0*w(0+1)+b1*wi;

for i=1:L-1
    m=i+1;
    w(m)=-a1*w(m-1)+x(m);
    y2(m)=b0*w(m)+b1*w(m-1);
end
t2=toc;

Error=(y1-y2);

subplot(2,2,1); stem(n,x); xlabel('n'); title('Se�al de Entrada x(n)');
subplot(2,2,2); stem(n,Error); xlabel('n'); title('Error= y1(n)-y2(n)');
subplot(2,2,3); stem(n,y1); xlabel(['n  ->  Tiempo Ejecuci�n=' num2str(t1)]); title('FD I: Se�al de Salida y1(n)' );
subplot(2,2,4); stem(n,y2); xlabel(['n  ->  Tiempo Ejecuci�n=' num2str(t2)]); title('FD II: Se�al de Salida y2(n)');







