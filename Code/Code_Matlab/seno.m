clear all;
m=200;                 %cantidad de muestras
F=40;             %freq de la senal en Hz
Tsample=0.005/F;        %periodo de muestreo en seg
n=-(m-1)/2:(m-1)/2;    %instantes de muestreo
nT=n*Tsample;
y=sin(2*pi*F*nT);
stem(nT,y);
title('Senal Discreta');
xlabel('nT');
ylabel('Magnitud');

%T=1/Fm
%F/Fm<=0.5  --> FT<=0.5 

%Si se cumple el teorema de Nyquist y entre mas pequena sea Fm la funcion
%plot si sirve para graficar la senal sin embargo esta senal la grafica
%como una senal analoga. 