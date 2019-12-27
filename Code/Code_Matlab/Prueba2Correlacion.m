clc; clear all; close all;

%% Se�al y(n)
A=0.5;
y=A*[1 2 3 4 5 4  3  2 1]; 
Ly=length(y);



%% Generaci�n de se�al x(n)
A1=3.0; A2=0.0; % Amplitudes de las cosenoidales
F1=30; F2=60; % Frecuencias de las cosenoidales
Fs=1200; % Frecuencia de muestreo
NT=Fs/min(F1,F2); %Periodo de la se�al seno
n=0:5*NT-1; %Instantes de tiempo a calcular
xx=A1*sin(2*pi*F1*n/Fs)+A2*cos((2*pi*F2*n/Fs));
Lx=length(xx);

%Ubicaci�n aleatoria
ind = randi(Lx,1,1);
while (ind<Ly || ind> (Lx-Ly))
    ind = randi(Lx,1,1);
end
x=xx; %copiar se�al

%Adicionar se�al 
x(ind: ind+Ly-1)=x(ind: ind+Ly-1)+y;

% Calcular Correlaci�n
[r, Li,Lf] = Correlacion(x, 0, y, 0 );
L=Li:Lf;

% Normalizar correlaci�n
Ex=sum(x.^2); %Energ�a de x(n)=rxx(0)
Ey=sum(y.^2); %Energ�a de y(n)=ryy(0)
ro=r/sqrt(Ex*Ey); % 

% Detecci�n del primer m�ximo de ro(L) 
[rmax,indL]=max(ro);


% Graficac�n
subplot(2,2,1); stem(n,xx);title('xx(n)' ); xlabel('n');grid on;
subplot(2,2,2); stem(n,x);title(['x(n) con Adici�n desde n=' num2str(ind-1)] ); xlabel('n');grid on;
subplot(2,2,3); stem(y);title('y(n)'); xlabel('n');grid on;
subplot(2,2,4); stem(L, ro);title(['ro(L), Lmax= ' num2str(L(indL))]) ; xlabel('L');grid on;