clc; clearvars; close all;
% Generaci�n de se�al x(n) con ruido
A=3.0;  F=30; % Amplitud y Frecuencia de la se�al
Fs=600; % Frecuencia de muestreo
NT=Fs/F; %Periodo de la se�al seno
n=0:5*NT-1; %Instantes de tiempo a calcular
x1=A*sin(2*pi*F*n/Fs);

RSN=rand(1);%Relaci�n se�al ruido en dB
x= awgn(x1,RSN,'measured'); %adicionar ruido blanco
Ex=sum(x.^2); % Energ�a de x(n)
% Calcular AutoCorrelaci�n
N=length(x); l=(-N+1):(N-1); % Intervalo de l
r=xcorr(x,x);
ro=r/Ex; % Normalizar correlaci�n
% Obtener media se�al de correlaci�n y suprimir valores negativos
y=ro(N:2*N-1);
[pks,locs1] = find(y<0);
y(locs1)=0; y=[zeros(1,3) y]; %Inclusi�n de ceros para detectar primer pico
% Encontrar picos y determinar periodo
%[pks,locs]= findpeaks(y,'SortStr','descend');
[pks,locs]= findpeaks(y,'MINPEAKDISTANCE', 4); %ordena y elimina picos muy cerca
Nest=locs(2)-locs(1);
% Visualizar
%stem([0:N-1],y(4:N+3)); figure; 
stem(y); figure; 
subplot(2,2,1); stem(n,x1);title(['x1(n) Se�al sin Ruido. Periodo=' num2str(NT)]); xlabel('n');grid on;
subplot(2,2,2); stem(n,x);title(['x(n) Se�al con Ruido: RSN=' num2str(RSN)] ); xlabel('n');grid on;
subplot(2,2,3:4); stem(l, ro);title(['ro(l), Periodo estimado= ' num2str(Nest)]); xlabel('l');grid on;