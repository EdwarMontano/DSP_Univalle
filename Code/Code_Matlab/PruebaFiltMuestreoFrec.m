clc; clear all; close all;

%% EJEMPLO TIPO 1
% Ejemplo 1  OK
% BETA=0,
% ALPHA=0
% M= 15;
% Hr=[1 1 1 1 0.4 0 0 0]
% h1= fmuestreo1(ALPHA, BETA, M, Hr)

% Ejemplo 2  OK
% BETA=0,
% ALPHA=0
% M= 32;
% Hr=[1 1 1 1 1  1 0.3789795 0 0 0  0  0  0 0  0  0];
% h1= fmuestreo1(ALPHA, BETA, M, Hr)

%% EJEMPLO TIPO 2

% Ejemplo 1  OK
% BETA=0
% ALPHA=0.5
% M= 32;
% Hr=[1 1 1 1 1  1 0.3570496 0 0 0  0  0  0 0  0  0];
% h2= fmuestreo2(ALPHA, BETA, M, Hr)

% Ejemplo 2  OK
% BETA=0;
% ALPHA=0.5;
% M= 15;
% Hr=[1 1 1 1 0.4 0 0 0];
% h2= fmuestreo2(ALPHA, BETA, M, Hr)


%% EJEMPLO TIPO 3

% Ejemplo 1  OK?
% BETA=1;
% ALPHA=0;
% M= 32;
% Hr=[1 1 1 1 1  1 0.3570496 0 0 0  0  0  0 0  0  0];
% h3= fmuestreo3(ALPHA, BETA, M, Hr)

% % Ejemplo 2  OK?
% BETA=1;
% ALPHA=0;
% M= 15;
% Hr=[0 0 0  0.4 1 1 1 1];
% h3= fmuestreo3(ALPHA, BETA, M, Hr)





%Ejemplo Filtros Simetricos - Paso-alto
% BETA=0;
% M=31;
% Hr=[ zeros(1,6) 0.3789795  ones(1,9)]; 
% ALPHA=0;

%Ejemplos Filtro Antisimetricos - %paso-banda 
% BETA=1;
% M =28;
% Hr=[ zeros(1,4) 0.4 ones(1,5) 0.4  zeros(1,4)]; 
% ALPHA=0;



% [h]= s_muestreofrec(ALPHA, BETA, M, Hr )
% n=[0:M];
% subplot(2,1,1); %
% graf_stemm(n,h,'Respuesta Impulsional','n','h(n)',4)
%  
% %Respuesta en Frecuencia
% NP=1; % número de periodos a graficar 
% N=512*2; % número de puntos por periodo 
% dw=pi/(N-1);
% w= 0:dw:(NP-dw)*pi; %Calcular valores de w
% %Respuesta en frecuencia
% num=h;den=[1]; H=freqz(num,den,w);
% %Graficación  |H(w)|
% subplot(2,1,2); graf_plotm(w/pi, abs(H) ,'Espectro Magnitud','\omega/\pi','|H(w)|-dB',4,'.','.');
%  

[h]= s_muestreofrec(ALPHA, BETA, M, Hr )
n=[0:M];
subplot(2,1,1); %
graf_stemm(n,h,'Respuesta Impulsional','n','h(n)',4)
 
%Respuesta en Frecuencia
NP=1; % número de periodos a graficar 
N=512*2; % número de puntos por periodo 
dw=pi/(N-1);
w= 0:dw:(NP-dw)*pi; %Calcular valores de w
%Respuesta en frecuencia
num=h;den=[1]; H=freqz(num,den,w);
%Graficación  |H(w)|
subplot(2,1,2); graf_plotm(w/pi, abs(H) ,'Espectro Magnitud','\omega/\pi','|H(w)|-dB',4,'.','.');
 
