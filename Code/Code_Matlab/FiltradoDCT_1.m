clc;clear all; close all;
%Generaci�n Se�al x(n)
%Frecuencias y amplitudes se�ales sinoidales
A0=1; %Nivel de DC
A1=1; F1=10;
A2=1; F2=20;
Fs= 300;%Frecuencia de muestreo
%obtener eje n igaula 5 veces el periodo de la se�al con menor frecuencia.
Fmin= min([F1 F2]);  
n=0:5*floor(Fs/Fmin); % valores eje tiempo discreto
xp=A0+A1*cos(2*pi*n*F1/Fs)+A2*cos(2*pi*n*F2/Fs); %se�al sin ruido
r=randn(1,length(n)); %ruido gaussiano
x= xp+r; %se�al con ruido
N=length(x);

% Transformada del Coseno
X=dct(x);
k=n; % �ndices eje "frecuencia" discreto (arm�nicos)
%Filtrado Ideal
Fi= 9 ; Ff= 11 ; % Rango de frecuencias a eliminar
ki=floor(Fi*2*N/Fs); kf=floor(Ff*2*N/Fs); % �ndices correspondientes
H=[zeros(1,ki) ones(1,kf-ki) zeros(1,N-kf)]; %Respuesta frecuencial filtro 

Xf=X.*H; % Filtrado en Frecuencia
xf=idct(Xf); % Transformada inversa

%Visualizaci�n Se�al x(n)
subplot(3,2,1);stem(n,x); xlabel('n'); ylabel('x(n)'); 
    title(['Se�al x(n),  Fs=' num2str(Fs)]);
    hold on; plot(xp,'LineWidth',3); grid on;
%Visualizaci�n Se�al X(m)
subplot(3,2,2);stem(k*Fs/(2*N),X); xlabel('f=k*Fs/(2N)'); ylabel('X(k)'); 
    title('X(k) (DCT de x(n))');grid on;
%Visualizaci�n Filtro Filtro(k)
subplot(3,2,3:4);stem(k*Fs/(2*N),H); xlabel('f=k*Fs/(2N)'); ylabel('H(k)'); 
    title(['Filtro H(k),  Fi=' num2str(Fi) ' Ff=' num2str(Ff)  ]);grid on;
%Visualizaci�n DCT Xf(k)
subplot(3,2,6);stem(k*Fs/(2*N),Xf); xlabel('f=k*Fs/(2N)'); ylabel('Xf(k)'); 
    title('Xf(k) (DCT filtrado)');grid on;
%Visualizaci�n Se�al xf(n)
subplot(3,2,5);stem(n,xf); xlabel('n'); ylabel('xf(n)'); 
    title('Se�al filtrada xf(n)' );grid on;
