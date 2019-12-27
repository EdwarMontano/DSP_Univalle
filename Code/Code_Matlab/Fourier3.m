clc; clear all; close all;

%%%%%%%%%%%%%%%%%
% DIFERENCIAS ENTRE LA TRANSFORMADA DE FOURIER Y LA FFT DE UNA SEÑAL DE
% TIEMPO DISCRETO
%%%%%%%%%%%%%%%%%

% Entrada Parámetros de Coseno: x(n)=A cos(wo n + Theta )

dlg_title = 'Parámetros x(n)';
prompt = { 'A:','Fa[Hz]:','Fase[rad]:'};
num_lines = 1;
defaultans = {'1.0','5','0.0'};
answerA = inputdlg(prompt,dlg_title,num_lines,defaultans);

A=str2num(answerA{1});
Fa=str2num(answerA{2});
Theta=str2num(answerA{3});


% Frecuencia de muestreo y longitud de x(n)
dlg_title = 'Fs y L de x(n)';
prompt = { 'F. muestreo:','Longitud x(n):'};
num_lines = 1;
Fs=10*Fa; FrecMuestr=num2str(Fs);
defaultans = {FrecMuestr, '500'};
answerP = inputdlg(prompt,dlg_title,num_lines,defaultans);

Fs=str2num(answerP{1});
L=str2num(answerP{2});


% Generación señal x(n)
n=0:L-1;           %instants 
%t = n/Fs;        % Time vector
x = A*cos(2*pi*Fa*n/Fs) ;


% Graficación de las señales discretas
% Entrada Número de muestras a visualizar: x(n)
dlg_title = 'Visualización x(n)';
prompt = { 'Muestras a Visualizar M:'};
num_lines = 1;
Mtempo=num2str(L/10);
defaultans = {Mtempo};
answerM = inputdlg(prompt,dlg_title,num_lines,defaultans);

M=str2num(answerM{1});


subplot(3,2,1:2); 
stem(n(1:M),x(1:M))
title(['Signal x(n),  Fa=' num2str(Fa) ', Fs=' num2str(Fs)])
xlabel('n'); ylabel('x(n)'); grid on


% Cálculo de la Transformada Discreta de Fourier (Es continua!!)
deltaw=pi/2000;
wk=0;
X=zeros(1,2000);
for w=-pi: deltaw : pi-deltaw
    suma=0;
    for n=0:L-1
      suma=suma+x(n+1)*exp(-1i*w*n); 
    end
    wk=wk+1;
    X(wk)=A*suma;
end
X=X/L; %Normalizar amplitud 

%Magnitud
Xmag = abs(X);
%Fase
Xfas = angle(X);

fx= [-pi: deltaw : pi-deltaw]*Fs/(2*pi);
    


subplot(3,2,3); plot(fx,Xmag); 
title('Transform: Amplitude Spectrum of x(n)'  )
xlabel('f (Hz)'); ylabel('|X(w)|'); grid on
subplot(3,2,4); plot(fx,Xfas); 
title('Transform: Phase Spectrum of x(n)')
xlabel('f (Hz)'); ylabel('Angle X(w)'); grid on


% Análisis Frecuencial Señal con FFT
Y = fftshift(fft(x)/L);
% Magnitud 
Ymag = abs(Y);
%Fase
Yfas = angle(Y);


%Define the frequency domain f and plot the amplitude spectrum P1. 
%On average, longer signals produce better frequency approximations.

fy= -(Fs/L)*(-L/2:(L/2)-1);

subplot(3,2,5); plot(fy,Ymag,'r');   
title('DFT: Amplitude Spectrum of x(n)')
xlabel('f (Hz)'); ylabel('|Y(f)|'); grid on
subplot(3,2,6); plot(fy,Yfas,'r -o'); 
title('DFT: Phase Spectrum of x(n)')
xlabel('f (Hz)'); ylabel('Angle Y(w)'); grid on

