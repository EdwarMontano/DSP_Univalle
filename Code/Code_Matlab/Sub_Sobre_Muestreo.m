clc; clear all; close all;

%%%%%%%%%%%%%%%%
% Operaciones de sub y sobre muestreo sobre se�ales de audio
%%%%%%%%%%%%%

% To select audio file number 1 

FileType={'*.mp3';'*.ogg';'*.flac'; '*.au'; '*.aiff'; '*.aif'; '*.aifc';...
           '*.m4a';'*.mp4'};
       
[NombreArch1,PathName1] = uigetfile(FileType,'Seleccione el archivo audio 1');

%Leer audio 1 y almacenarla en una variable
audio1=strcat(PathName1, NombreArch1);
[x1,fs1]=audioread(audio1 );

%Obtener informaci�n de archivo-audio 1
Informx1=audioinfo(audio1 )


% To select audio file number 2 
    
[NombreArch2,PathName2] = uigetfile(FileType,'Seleccione el archivo audio 2');

%Leer audio 2 y almacenarla en una variable
audio2=strcat(PathName2, NombreArch2);
[x2,fs2]=audioread(audio2);

%Obtener informaci�n de archivo-audio 2
Informx2=audioinfo(audio2)


%1. Comparar longitudes, n�mero de canales y frecuencia de muestreo de las
%se�ales de audio

%2. Ajuste de frecuencias de muestreo


%3. Selecci�n Operaci�n entre audios

   suma
   resta
   intercambio de canales
   
   
%4. Graficaci�n


%5. Reproducci�n de audios


% % Entrada Amplitudes de Sinosoidales: x(n)
% dlg_title = 'Amplitudes x(n)';
% prompt = { 'A1:','A2:','A3:','A4:'};
% num_lines = 1;
% defaultans = {'0.5','0.7','0.9','1.1'};
% answerA = inputdlg(prompt,dlg_title,num_lines,defaultans);
% 
% A1=str2num(answerA{1});
% A2=str2num(answerA{2});
% A3=str2num(answerA{3});
% A4=str2num(answerA{4});
% 
% % Entrada Frecuencias de Sinosoidales: x(n)
% dlg_title = 'Frecuencias x(n)';
% prompt = { 'F1:','F2:','F3:','F4:'};
% num_lines = 1;
% defaultans = {'25','50','100','150'};
% answerF = inputdlg(prompt,dlg_title,num_lines,defaultans);
% 
% F1=str2num(answerF{1});
% F2=str2num(answerF{2});
% F3=str2num(answerF{3});
% F4=str2num(answerF{4});
% 
% 
% % Frecuencia de muestreo y longitud de x(n)
% dlg_title = 'Fs de x(n)';
% prompt = { 'F. muestreo:','Longitud x(n):'};
% num_lines = 1;
% 
% Fm=4*max([F1  F2 F3 F4 ]); FrecMuestr=num2str(Fm);
% 
% defaultans = {FrecMuestr, '500'};
% answerP = inputdlg(prompt,dlg_title,num_lines,defaultans);
% 
% Fs=str2num(answerP{1});
% L=str2num(answerP{2});
% 
% 
% % Generaci�n se�al sin RUIDO
% 
% n=0:L-1;           %instants 
% t = n/Fs;        % Time vector
% x = A1*cos(2*pi*F1*n/Fs) + A2*cos(2*pi*F2*t) + A3*sin(2*pi*F3*t)+ A4*sin(2*pi*F4*t);
% 
% 
% %Se�al con ruido blanco(media cero y desviaci�n est�ndar 2)
% y = x + 2*randn(size(x));
% 
% % Graficaci�n de las se�ales discretas
% 
% % Entrada N�mero de muestras a visualizar: x(n)
% dlg_title = 'Visualizaci�n x(n)';
% prompt = { 'Muestras a Visualizar M:'};
% num_lines = 1;
% Mtempo=num2str(L);
% defaultans = {Mtempo};
% answerM = inputdlg(prompt,dlg_title,num_lines,defaultans);
% 
% M=str2num(answerM{1});
% 
% 
% subplot(2,1,1); 
% stem(n(1:M),x(1:M))
% title('Signal without Noise')
% xlabel('n'); ylabel('x(n)'); grid on
% subplot(2,1,2); 
% stem(n(1:M),y(1:M))
% title('Signal with Noise')
% xlabel('n'); ylabel('y(n)'); grid on
% 
% 
% % An�lisis Frecuencial Se�al sin ruido
% X = fftshift(fft(x)/L);
% % Magnitud 
% %Xmag = abs(Ys/L);
% Xmag = abs(X);
% %Fase
% Xfas = angle(X);
% 
% % An�lisis Frecuencial Se�al con ruido
% Y =fftshift( fft(y)/L);
% % Magnitud 
% Ymag = abs(Y);
% %Fase
% Yfas = angle(Y);
% 
% %Define the frequency domain f and plot the amplitude spectrum P1. 
% %The amplitudes are not exactly as expected, because of the added noise. 
% %On average, longer signals produce better frequency approximations.
% 
% %f = Fs*(0:(L/2))/L;
% %f= (Fs/L)*(0:L-1);
% f= -(Fs/L)*(-L/2:(L/2)-1);
% 
% figure; subplot(2,2,1); plot(f,Xmag); 
% title('DFT: Amplitude Spectrum of x(n)')
% xlabel('f (Hz)'); ylabel('|X(w)|'); grid on
% subplot(2,2,2); plot(f,Xfas); 
% title('Phase Spectrum of x(n)')
% xlabel('f (Hz)'); ylabel('Angle X(w)'); grid on
% 
% 
% subplot(2,2,3); plot(f,Ymag); 
% title('DFT: Amplitude Spectrum of y(n)')
% xlabel('f (Hz)'); ylabel('|Y(f)|'); grid on
% subplot(2,2,4); plot(f,Yfas); 
% title('Phase Spectrum of x(n)')
% xlabel('f (Hz)'); ylabel('Angle Y(w)'); grid on
% 
