clc; clear all; close all;
dw=2*pi/100; %subdivisiones eje frecuencia
NC=5; %Número de periodos a visualizar a cada lado
w=-NC*pi+dw:dw:NC*pi; %valores eje w
% TF de la Señal u(n)
X1= exp(1i*w/2)./(2*1i*sin(w/2))
MagX1=20*log10(abs(X1));
FasX1=angle(X1)*180/pi;
% TF de la Señal (-1)^n
X2= exp(1i*w/2)./(2*cos(w/2))
MagX2=20*log10(abs(X2));
FasX2=angle(X2)*180/pi;
% Graficación
subplot(2,2,1);
plot(w/pi,MagX1);title('Magnitud X1(w)'); grid on;
xlabel('w *\pi rad/muestra'); ylabel('Magnitud (dB)');
subplot(2,2,2);
plot(w/pi,MagX2);title('Magnitud X2(w)'); grid on;
xlabel('w *\pi rad/muestra'); ylabel('Magnitud (dB)');
subplot(2,2,3);
plot(w/pi,FasX1);title('Fase X1(w)'); grid on;
xlabel('w *\pi rad/muestra'); ylabel('Fase (grados)');
subplot(2,2,4);
plot(w/pi,FasX2);title('Fase X2(w)'); grid on;
xlabel('w *\pi rad/muestra'); ylabel('Fase (grados)');
