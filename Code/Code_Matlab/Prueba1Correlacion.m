clc; clearvars;  close all;

% OBTENER LA CORRELACIÓN r(n) (CON Y SIN NORMALIZACIÓN) DE DOS SEÑALES DISCRETAS x(n) y(n)
% 

%Entrar datos señal x(n)
prompt = {'x(n):','n_ini:'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'1  2  3.1  2  1  -1.5  -1.5  -1.5  -1.1  -1.1  0 0 0','-2'};

xdat = inputdlg(prompt,dlg_title,num_lines,defaultans);
x=str2num(xdat{1});
ni_x=str2num(xdat{2}); %instante inicial
nf_x=length(x)+ni_x -1; %instante final
%vector de n para x(n)
nx=ni_x: nf_x;

%Entrar datos señal y(n)
prompt = {'y(n):','n_ini:'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {' 1  2  3.1  2  1','3'};
ydat = inputdlg(prompt,dlg_title,num_lines,defaultans);
y=str2num(ydat{1});
ni_y=str2num(ydat{2});
nf_y=length(y)+ni_y -1;

%vector de n para y(n)
ny=ni_y: nf_y;

% Cálculo de la correlación sin normalizar
[r, Li,Lf] = Correlacion(x, ni_x, y, ni_y );

%Normalización de la correlación
Ex=sum(x.^2); %Energía de x(n)=rxx(0)
Ey=sum(y.^2); %Energía de y(n)=ryy(0)
ro=r/sqrt(Ex*Ey); 

% Detección del primer máximo de ro(L) 
[rmax,indl]=max(ro);
L=Li:Lf;  %Rango de valores de L

% Graficación
subplot(2,2,1); stem(nx,x,'b *');title('x(n)'); xlabel('n');grid on;
subplot(2,2,2); stem(ny,y,'r s');title('y(n)'); xlabel('n');grid on;
subplot(2,2,3); stem(nx,x, 'b*'); hold on; stem(ny,y, 'r s');   title('x(n) , y(n)'); xlabel('n');grid on;
subplot(2,2,4); stem(L,ro);title(['ro(L), Lmax= ' num2str(L(indl))]); xlabel('L');grid on;

%Grafica para comparar resultado con Matlab
figure
% Calculo de r(L) 
[rmat, lags]=xcorr(x,y);
subplot(2,1,1); stem(L,r);title('r(L) propio'); xlabel('L');grid on;
subplot(2,1,2); stem(lags,rmat);title('r(L) Matlab: Adiciona ceros no necesarios'); xlabel('L');grid on;


