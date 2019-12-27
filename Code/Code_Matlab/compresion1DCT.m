clc; clear all; close all;
%% Señal de entrada
xdata = inputdlg('Números separados por espacios', 'Señal a comprimir', [1 50]);
%x=[0.1  0.2  0.3  0.4 0.5 0.4 0.3  0.2  0.1 0.0  0.1  0.2  0.3  0.4 0.5 0.4  0.3  0.2  0.1 0.0 0.1  0.2  0.3  0.4 0.5 0.4 0.3  0.2  0.1 0.0];
x = str2num(xdata{:});
L=length(x); %Tamaño señal
n=0:L-1; %instantes de x(n)
if ~(L>0)
   errordlg('No hay señal a procesar','Error Señal');
   error('Error: Señal vacía')
end
% Porcentage de energía a conservar
PorcDefault = {'98'};
peconser = inputdlg('Procentaje energía conservar (0-100)', 'Porcentaje', [1 50], PorcDefault);
pe = str2double(peconser{:}); 
Ex= sum(abs(x).^2);% Energía total de la señal x
X=dct(x);% Cálculo de la DCT
% Vector energía acumulado
EXa(1)=abs(X(1))^2;
for m=2:L
   EXa(m)=EXa(m-1)+abs(X(m))^2;
end
EX= EXa(L); %Valor total de energía

% Energía a conservar
Econs=EX*pe/100;

%Encontrar primer índice >=  Econservar (inician desde cero)
Lc=find(EXa>= Econs,1,'first');  

%% COMPRIMIDO
Xcomp=[X(1:Lc) zeros(1, L-Lc)]; % Llenar con ceros
xcomp=idct(Xcomp); %IDCT de la señal con menos coeficientes
% Vector energía acumulado - Comprimido
EXcomp(1)=abs(Xcomp(1))^2;
for m=2:L
   EXcomp(m)=EXcomp(m-1)+abs(Xcomp(m))^2;
end
EXc= EXcomp(L); %Valor total de energía conservada

% Visualizar
subplot(2,3,1); stem(n,x); title('Señal x(n)'); grid on;
subplot(2,3,2); stem(n,X); title('DCT: X(m)');grid on; xlabel(['Coeficientes Totales=' num2str(L) ])
subplot(2,3,3); stem(n,EXa); title('Energía - Acumulado X(m)^2');grid on; xlabel(['Energía Total = ' num2str(EX)]);
subplot(2,3,4); stem(n,xcomp); title('Comprimido: Señal x(n) aproximada');grid on; xlabel(['Tasa Compresión =1:' num2str(L/Lc)])
subplot(2,3,5); stem(n,Xcomp); title('Comprimido: DCT Xc(m)');grid on; xlabel(['Coeficientes Conservados= 0,..,' num2str(Lc-1) '' ])
subplot(2,3,6); stem(n,EXcomp); title('Comprimido: Energía - Acumulado Xc(m)^2');grid on; xlabel(['Energía Total = ' num2str(EXc) ' =' num2str(100*EXc/Ex) '%' ]);


