
clc;clear all; close all

%Seleccionar archivo excel
[NombreArch,PathName] = uigetfile('*.xlsx','Seleccione el archivo excel');

%hoja='Hoja1';
hoja='SunSpot_NASA';
[datos,txt,raw] = xlsread(NombreArch,hoja);

[H,W]=size(datos);

% Rango de A�os 
n=datos(1,1):datos(H,W-1);

% Entrar rango de a�os para calcular la correlaci�n
prompt = {['Rango de n (maximo n= ' num2str(length(n)) '):']};
dlg_title = 'Rango de n para rxx(L)';
num_lines = 1;
defaultans = {'100'};
ndat = inputdlg(prompt,dlg_title,num_lines,defaultans);
nmax=str2num(ndat{1});

% Obtener el n�mero de manchas en cada a�o
x=zeros(1,H*W/2);

for i=1:W/2
   mi=(i-1)*H+1;
   mf=i*H;
   x(mi: mf)=datos(:,2*i);
end

xtrunc=x(1:nmax);

% C�lculo de la correlaci�n sin normalizar
[r, Li,Lf] = Correlacion(xtrunc, n(1), xtrunc, n(1));

%Normalizaci�n de la correlaci�n
Ext=sum(xtrunc.^2); %Energ�a de x(n)=rxx(0)
ro=r/Ext; 
L=Li:Lf;

%Calculo del periodo
[peaks,locs] = findpeaks(ro); %Detectar picos de la correlaci�n
[ind]=find(peaks==1);
Lpeaks=length(locs);

if Lpeaks>=2
    periodo=locs(ind)-locs(ind-1)
else
   periodo=0;
   display('Solo hay un pico en r(L)');
end

% Graficaci�n
subplot(2,1,1); stem(n,x,'b *');title('x(n): Manchas Solares W�lfer '); xlabel('a�os');grid on;
subplot(2,1,2); stem(L,ro);title(['Autocorrelaci�n, Periodo=' num2str(periodo)]  ); xlabel('L - a�os');grid on;
