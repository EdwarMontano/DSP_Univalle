clear all
clc
close all
figure
% Ejemplo 6.4.  Diseño Filtros FIR muestreo en frecuencia

%Ejemplos Filtros Simetricos
BETA=0;
% 
% ORDEN=14;
% Hr=[1 1  1  1 0.4  0 0 0 ]; %Paso-bajo
% ALPHA=0;

% ORDEN=14;
% Hr=[ ones(1,4) 0.5  zeros(1,3)]; %Paso-bajo
% ALPHA=0;

% ORDEN=31;
% % Hr=[ ones(1,6) 0.3789795  zeros(1,9)]; %Paso-bajo
% Hr=[ zeros(1,6) 0.3789795  ones(1,9)]; %Paso-alto
% ALPHA=0;


% ORDEN=31;
% %Hr=[ones(1,6) 0.357  zeros(1,9)];  %Paso-bajo
% Hr=[ones(1,6) 0.5  zeros(1,9)];  %Paso-bajo
% % Hr=[ones(1,6) 0.3570496  zeros(1,9)];  %Paso-bajo
% % Hr=[zeros(1,6) 0.3570496  ones(1,9)];  %Paso-alto
% ALPHA=0.5;

% ORDEN =15
% Hr=[ones(1,4) 0.36308594 zeros(1,3)];
% %Hr=[ones(1,4) 0.5 zeros(1,3)];
% 
% ALPHA=0.5;

%Ejemplos Filtros Anti-Simetricos
 BETA=1;
 
% ORDEN=14;
% Hr=[ zeros(1,4) 0.4  ones(1,3)];
% ALPHA=0;

ORDEN =28;
% Hr=[  zeros(1,5) 0.4  ones(1,9)]; %paso-alto
%Hr=[  ones(1,5) 0.4  zeros(1,9)]; %paso-bajo
Hr=[ zeros(1,4) 0.4 ones(1,5) 0.4  zeros(1,4)]; %paso-banda !!!!!
%Hr=[ ones(1,4) 0.4 zeros(1,5) 0.4  ones(1,4)]; %banda-rechazo
ALPHA=0;


% ORDEN=31;
% %Hr=[ones(1,6) 0.3789795  zeros(1,9)]; No adecuado paso bajo ni paso alto
% %Hr=[zeros(1,9) 0.3789795  ones(1,6)];
% Hr=[zeros(1,5) 0.3789795 ones(1,4)  0.3789795  zeros(1,5 )];
% ALPHA=0;

% ORDEN=31;
% Hr=[zeros(1,9) 0.3570496  ones(1,6)];
% ALPHA=0.5;

% ORDEN=30;
% %Hr=[zeros(1,7) 0.3570496  ones(1,7) ]; %paso alto
% %Hr=[ones(1,7) 0.3570496  zeros(1,7) ]; %paso bajo
% %Hr=[ones(1,4) 0.3570496 zeros(1,5) 0.3570496  ones(1,4) ]; %rechaza banda
% Hr=[zeros(1,4) 0.3570496 ones(1,5) 0.3570496  zeros(1,4) ]; %pasa banda
% ALPHA=0.5;


[h]= s_muestreofrec(ALPHA, BETA, ORDEN, Hr )

n=[0:ORDEN];
subplot(2,1,1); %
graf_stemm(n,h,'Respuesta Impulsional','n','h(n)',4)

%Respuesta en Frecuencia
%Calcular valores de w
NP=1; % número de periodos a graficar 
N=512*2; % número de puntos por periodo 
dw=pi/(N-1);
%w= -(NP-dw)*pi:dw:(NP-dw)*pi;
w= 0:dw:(NP-dw)*pi;

%Respuesta en frecuencia
num=h;den=[1]; H=freqz(num,den,w);
%Graficación  |H(w)|
%subplot(2,1,2); graf_plotm(w/pi, 20*log10(abs(H)) ,'Espectro Magnitud','\omega/\pi','|H(w)|-dB',4,'.','.');
subplot(2,1,2); graf_plotm(w/pi, abs(H) ,'Espectro Magnitud','\omega/\pi','|H(w)|-dB',4,'.','.');



