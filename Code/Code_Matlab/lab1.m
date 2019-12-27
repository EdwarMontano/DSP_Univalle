clear all;
n=-10:19;
F=60;
Fm=753.7688;
seno=sin(2*pi*F*n/Fm);
stem(n, seno);
xlabel('Instantes n');
ylabel('seno(n)');

%SENO: x(n)=A*seno(2*pi*F*n/Fm+teta)
%A=amplitud, teta=desplazamiento
%F=frecuencia de la senal analoga
%Fm=frecuencia de muestreo

%Teorema de nyquist
%f=F/Fm --> |f|<=0.5
%1/2=2piF/Fm
%f=0.0796

%Para corregir el problema la senal debe tener cero desplazamiento