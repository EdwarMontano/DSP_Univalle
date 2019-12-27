clc; clear all; close all;


%%%%%%%%%%%%%%%
%FFT de una  señal compuesta (tres cosenoidales) con y sin ruido - Espectro Magnitud Unilateral
%%%%%%%%%%%%%%%

%Parámetros de la señal y muestreo
Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
n=0:L-1;        %instants 
t = n*T;        % Time vector

% Señal 
S = 0.7*sin(2*pi*50*t) + 0.5* sin(2*pi*120*t) + 1.2* cos(2*pi*100*t);

%Señal afectada con ruido blanco(media cero y desviación estándar 2)
X = S + 2*randn(size(t));

% Graficación de las señales continuas
subplot(2,2,1); 
plot(t(1:50),S(1:50))
title('Signal without Noise')
xlabel('t (milliseconds)'); ylabel('S(t)')
subplot(2,2,2); 
plot(t(1:50),X(1:50))
title('Signal with Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')
% Graficación de las señales discretas
subplot(2,2,3); 
stem(n(1:50),S(1:50))
title('Signal without Noise')
xlabel('n'); ylabel('S(n)')
subplot(2,2,4); 
stem(n(1:50),X(1:50))
title('Signal with Noise')
xlabel('n'); ylabel('X(n)')


% Análisis Frecuencial Señal sin ruido
Ys = fft(S);
% Magnitud 
Ps2 = abs(Ys/L);
Ps1 = Ps2(1:L/2+1);
Ps1(2:end-1) = 2*Ps1(2:end-1);


% Análisis Frecuencial Señal con ruido
Yx = fft(X);
% Magnitud 
Px2 = abs(Yx/L);
Px1 = Px2(1:L/2+1);
Pp=Px1;
Px1(2:end-1) = 2*Px1(2:end-1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1. 
%The amplitudes are not exactly at 0.7 and 1, as expected, because of the added noise. 
%On average, longer signals produce better frequency approximations.

f = Fs*(0:(L/2))/L;

figure; subplot(2,1,1); plot(f,Ps1); 
title('Single-Sided Amplitude Spectrum of S(n)')
xlabel('f (Hz)'); ylabel('|Ps1(f)|'); grid on

subplot(2,1,2); plot(f,Px1); 
title('Single-Sided Amplitude Spectrum of X(n)')
xlabel('f (Hz)'); ylabel('|Px1(f)|'); grid on
