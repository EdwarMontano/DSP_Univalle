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
peconser = inputdlg('Porcentaje energía conservar (0-100)', 'Porcentaje', [1 50],PorcDefault);
pe = str2double(peconser{:}); 
Ex= sum(abs(x).^2);% Energía total de la señal x
X=dct(x);% Cálculo de la DCT
% Energía en dominio transformado
EX= sum(X.^2); %Valor total de energía
% Energía a conservar
Econs=EX*pe/100;



%% COMPRIMIDO

%Densidad de energía dominio transformado
dEX=X.^2;
[Val,Ind]=sort(dEX,'descend'); %Ordenar de mayor a menor
i=1;
Ea=dEX(Ind(i)); %Energía acumulado
while Ea<=Econs 
    i=i+1;
    Ea=Ea+dEX(Ind(i));
end
Ind_c=Ind(1:i); %Indices utilizados para comprimir

%
Xcomp=zeros(1,L); %Llenar con ceros 
Xcomp(Ind_c)=X(Ind_c); % Llenar con valores de X
Lc=length(Ind_c);  %Cantidad de coeficientes

xcomp=idct(Xcomp); %IDCT de la señal con menos coeficientes
% Vector Densidad de energía acumulado - Comprimido
dEXcomp=abs(Xcomp.^2);
EXc= sum(dEXcomp); %Valor total de energía conservada comprimido

% Visualizar
subplot(2,3,1); stem(n,x); title('Señal x(n)'); grid on;
subplot(2,3,2); stem(n,X); title('DCT: X(m)');grid on; xlabel(['Coeficientes Totales=' num2str(L) ])
subplot(2,3,3); stem(n,dEX); title('Densidad de Energía X(m)^2');grid on; xlabel(['Energía Total = ' num2str(EX)]);
subplot(2,3,4); stem(n,xcomp); title('Comprimido: Señal xc(n) aproximada');grid on; xlabel(['Tasa Compresión =1:' num2str(L/Lc)])
subplot(2,3,5); stem(n,Xcomp); title('Comprimido: DCT Xc(m)');grid on; xlabel(['Coeficientes Conservados= 0,..,' num2str(Lc-1) '' ])
subplot(2,3,6); stem(n,dEXcomp); title('Comprimido: Densidad de Energía Xc(m)^2');grid on; xlabel(['Energía Total = ' num2str(EXc) ' =' num2str(100*EXc/Ex) '%' ]);


