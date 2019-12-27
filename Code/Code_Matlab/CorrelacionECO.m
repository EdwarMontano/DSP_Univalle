clc; clear all; close all;

% F=50; %Frecuencia an�loga
% Fs=1000; %Frecuencia de muestreo
% N=Fs/F  %Periodo
% L=100; %cantidad de muestras 
% n=0:L-1;
% s=abs(cos(2*pi*F*n/Fs)); %se�al emitida

% Otra se�al s

s1=2*[0.1  0.2 0.2  0.3 0.3  0.4 0.4 0.4 0.4  0.5 0.5 0.5 0.5 0.5  0.6  0.6 0.6 0.6 0.6 0.6 ];
s=[s1 s1 s1];
L=length(s);
n=0:L-1;

% Se�al retrazada y atenuada
a1=0.5;  %atenuaci�n
K1=4; %Retardo no puede ser mayor a la mitad del periodo
sm = a1*(circshift(s',K1))';

%Se�al recibida en estado permanente!!!
x=s+sm; %Se�al m�s el eco

%Autocorrelaci�n de x
rxx=xcorr(x);

%Autocorrelaci�n de s
rss=xcorr(s);

%Cros Correlaci�n
rsx=xcorr(s,x);

%Cros Correlaci�n
[rsmx,lg]=xcorr(sm,x);


% Graficaci�n
subplot(2,2,1); stem(n,s); title('Se�al Emitida s(n)'); ylabel('s(n)');grid on;
subplot(2,2,2); stem(n,x); title('Se�al Recibida x(n)'); ylabel('x(n)');grid on;
subplot(2,2,3); stem(lg,rss); title('Autocorrelaci�n de s');xlabel('l');grid on;
subplot(2,2,4); stem(lg,rxx); title('Autocorrelaci�n de x');xlabel('l');grid on;

% Otras Graficas
figure;
subplot(2,2,1); stem(n,s); title('s(n)');
subplot(2,2,2); stem(n,sm); title('sm(n)');
subplot(2,2,3); stem(n,x); title('x(n)');
subplot(2,2,4); stem(lg,rsmx); title('Cross correlaci�n de sm y x')



% Calculo de a1

rxx0=max(rxx);
[rss0, ind]=max(rss);
D1=K1;
rssd1=rss(ind+D1);


a=rss0;
b=2*rssd1;
c=rss0-rxx0;
aa1=roots([a b c])
