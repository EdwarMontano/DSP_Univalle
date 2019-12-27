% Calcula 2m+1 muestras de la funcion x(t)=sin(2*pi*fc*t)/(pi*t)
% para n=-m : m (es decir, centrado alrededor del origen).
% fc :Frecuencia de corte [Hz] asociada a un filtro paso bajo
% :normalizada entre 0 y 1 respecto a la frecuencia de muestreo, por lo tanto la
% :frecuencia maxima permitida es fc=0.5.
% x :salida, muestras de la funcion sinc

%x(n)=sin(2*pi*fc*n)/(pi*n)
%fc=freq de corte discreta fc debe ser <=0.5
clear all;
m=100;
fc=0.1;
wc=fc*2*pi;
n=(-m:m);   %2m+1 instantes de muestreo centrado alrededor de cero
xn=sin(wc*n);
xd=pi*n;
x(1:m)= xn(1:m)./ xd(1:m) ;
x(m+1)=2*fc ;
x(m+2:2*m+1)= xn(m+2:2*m+1)./ xd(m+2:2*m+1) ;    %QUE SIGNIFICA EL PUNTO ???
% graficar señal
figure;
stem(n, x);
title( strcat('Generacion de la Señal Sinc -- fc= ', num2str(fc) ) );
xlabel ('Instantes n');
ylabel ('Señal Sinc'),

%Si se presentan cambios cuando se varia m dado que entre mas muestras de
%la senal mejor. 

% cuando varia fc que es la freq discreta de la senal claro que cambia la
% senal, dado que dentro del limite de Nyquist las senales son distintas y
% unicas y fuera de los limites de Nyquist la senal no corresponde a la
% sinc(n)

%EL PUNTO SIGINIFICA COMO COMO COJER LA MATRIZ ENTERA

