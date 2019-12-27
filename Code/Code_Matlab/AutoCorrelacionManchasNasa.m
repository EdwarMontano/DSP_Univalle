
clc;clear all; close all

%Seleccionar archivo excel
[NombreArch,PathName] = uigetfile('*.xlsx','Seleccione el archivo excel');

%hoja='Hoja1';
hoja='SunSpot_NASA';
[datos,txt,raw] = xlsread(NombreArch,hoja);

[H,W]=size(datos);

% Rango de Años 
n=datos(1,1):datos(H,1);

% Entrar rango de años para calcular la correlación
prompt = {['Rango de n (maximo n= ' num2str(length(n)) '):']};
dlg_title = 'Rango de n para rxx(L)';
num_lines = 1;
defaultans = {'100'};
ndat = inputdlg(prompt,dlg_title,num_lines,defaultans);
nmax=str2num(ndat{1});

%%% Obtener el número de manchas en cada año%%
%% Existen datos por mes en la tabla de la NASA!!
x=zeros(1,H*W/2);

for i=1:W/2
   mi=(i-1)*H+1;
   mf=i*H;
   x(mi: mf)=datos(:,2*i);
end

xtrunc=x(1:nmax);

% Cálculo de la correlación sin normalizar
[r, Li,Lf] = Correlacion(xtrunc, n(1), xtrunc, n(1));

%Normalización de la correlación
Ext=sum(xtrunc.^2); %Energía de x(n)=rxx(0)
ro=r/Ext; 
L=Li:Lf;

%Calculo del periodo
[peaks,locs] = findpeaks(ro); %Detectar picos de la correlación
[ind]=find(peaks==1);
Lpeaks=length(locs);

if Lpeaks>=2
    periodo=locs(ind)-locs(ind-1)
else
   periodo=0;
   display('Solo hay un pico en r(L)');
end

% Graficación
subplot(2,1,1); stem(n,x,'b *');title('x(n): Manchas Solares Wölfer '); xlabel('años');grid on;
subplot(2,1,2); stem(L,ro);title(['Autocorrelación, Periodo=' num2str(periodo)]  ); xlabel('L - años');grid on;
