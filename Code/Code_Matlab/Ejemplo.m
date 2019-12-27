clc;clear all; close all

% Ejemplo caso I  (M par) Funcionando !!
% ALPHA=0.0;
% BETA=0;
% ORDEN=32;
% Hr=[ 1 1 1 1 1 1 0.3789795  0 0 0 0 0 0 0 0 0 ];


% Ejemplo caso I (M impar) Funcionando !!

% ALPHA=0;
% BETA=0;
% ORDEN=15;
% Hr=[ ones(1,4) 0.4  zeros(1,3)]; 


% Ejemplo caso II  (M par) Funcionando !!
% ALPHA=0.5;
% BETA=0;
% ORDEN=32;
% Hr=[ 1 1 1 1 1 1 0.3570496  0 0 0 0 0 0 0 0 0 ];


% Ejemplo caso II  (M impar) 
ALPHA=0.5;
BETA=0;
ORDEN=31;
Hr=[ 1 1 1 1 1 0.4  0 0 0 0 0 0 0 0 0 ];



[h]= s_muestreofrec(ALPHA, BETA, ORDEN, Hr )
n=[0:ORDEN-1];
subplot(2,1,1); 
graf_stemm(n,h,'Respuesta Impulsional','n','h(n)',4)
 
%Respuesta en Frecuencia
NP=1; % número de periodos a graficar 
N=512*2; % número de puntos por periodo 
dw=pi/(N-1);
w= 0:dw:(NP-dw)*pi; %Calcular valores de w
%Respuesta en frecuencia
num=h;den=[1]; H=freqz(num,den,w);
%Graficación  |H(w)|
subplot(2,1,2); graf_plotm(w/pi, abs(H) , ...
    'Espectro Magnitud','\omega/\pi','|H(w)|-dB',4,'.','.');
 
