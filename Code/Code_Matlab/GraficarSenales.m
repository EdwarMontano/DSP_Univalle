clc; clearvars; close all;

% Se�al Impulso
A=5; % Amplitud
ni=-10; %Instante de inicio
nf=15;  % Instante final
x=A*[zeros(1,abs(ni)) 1 zeros(1,abs(nf))]; % Se�al impulso
n=ni:nf;  % Instantes de tiempo
subplot(2,2,1);
stem(n,x); xlabel('n'); ylabel('x(n)'); title('Se�al Impulso');grid on


% Se�al Escal�n
A=7;
ni=-10; %Instante de inicio
nf=5;  % Instante final
x= A*[zeros(1,abs(ni))  ones(1, abs(nf)+1)  ]; 
n=ni:nf;  % Instantes de tiempo
subplot(2,2,2);
stem(n,x); xlabel('n'); ylabel('x(n)'); title('Se�al Escal�n');grid on

% Se�al Rampa
A=7;
ni=-9; %Instante de inicio
nf=5;  % Instante final
n=ni:nf;  % Instantes de tiempo
x=A*n;
subplot(2,2,3);
stem(n,x); xlabel('n'); ylabel('x(n)'); title('Se�al Rampa');grid on


% Se�al Exponencial Base Real
A=2;
a=-0.9; % Base real 
ni=-9; %Instante de inicio
nf=50;  % Instante final
n=ni:nf;  % Instantes de tiempo
x= A*a.^n;
subplot(2,2,4);
stem(n,x); xlabel('n'); ylabel('x(n)'); title('Se�al Exponencial');grid on

% Se�al Exponencial Base Compleja
A=1.5;
b=0.9+1i*0.8; %Base complej
ni=-9; %Instante de inicio
nf=5;  % Instante final
n=ni:nf;  % Instantes de tiempo
x= A*b.^n;

xr= real(x);
xi= imag(x);
xmag= abs(x);
xang= angle(x);

figure
subplot(2,2,1);
stem(n,xr); xlabel('n'); ylabel('x(n) Real'); title('Se�al Exponencial Compleja');grid on

subplot(2,2,2);
stem(n,xi); xlabel('n'); ylabel('x(n) Imaginario'); title('Se�al Exponencial Compleja');grid on

subplot(2,2,3);
stem(n,xmag); xlabel('n'); ylabel('x(n) Mag'); title('Se�al Exponencial Compleja');grid on

subplot(2,2,4);
stem(n,xang); xlabel('n'); ylabel('x(n) Angle'); title('Se�al Exponencial Compleja');grid on

%% Se�al Senoidal
A=1.5;
F= 20;   % Frecuencia an�loga
Fs=415; % Frecuencia de muestreo
Ts=1/Fs;
ni=-10;
nf=60;
n=ni:nf;
x= A*sin(2*pi*F*n/Fs);

figure
stem(n,x);
xlabel('n'); ylabel('x(n)'); title(['Se�al Senoidal, F=' num2str(F) ' Fs= ' num2str(Fs)]);grid on
