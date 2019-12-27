clc; clearvars; close all;
% Entrada h(n) y x(n)
dlg_title = 'Convolución';
prompt = { 'Entre h(n):','Entre n inicial:', 'Entre x(n):','Entre n inicial:'};
num_lines = 1;
defaultans = {'1/5 1/5 1/5 1/5 1/5 ', '0', ...
 '0.82  1  0.8  1.1  0.9   1.2  0.9  0.8  1.15  0.95  1.13  0.9  1.2  0.88  1.1', '-1'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

% Obtención de h(n) 
h=str2num(answer{1});
nhi=str2num(answer{2});   %instante inicio
lh=length(h);   %longitud vector h
nhf=lh+nhi-1;      %instante final

% Obtención de x(n) 
x=str2num(answer{3});
nxi=str2num(answer{4});
lx=length(x);
nxf=lx+nxi-1;

% Datos de salida y(n)
nyi=nhi+nxi;  % Instante inicio
nyf=nhf+nxf;  % Instante final

% Calculo de la convolución : y(n) = suma_k [x(k) h(n-k)]
y=zeros(1,lh+lx-1);
i=0;
for  n=nyi:nyf
   i=i+1;  
   temp=0; 
   for k= nxi: nxf
       kx=k-nxi+1; %ajuste del indice de x(n) para evitar salir rango de Matlab
       ind= n-k;
       if  ind >= nhi && ind <= nhf
         n_k= ind-nhi+1;  %ajuste del indice de h(n-k) para evitar salir rango de Matlab
         temp=temp+x(kx)*h(n_k);
       end
   end
   y(i)=temp;
   
end

ErrorConv=y-conv(x,h); % Error respecto a la función Matlab

%Graficación
subplot(2,2,1); stem(nxi:nxf,x, 'b');title('Input Signal');xlabel('n');ylabel('x(n)');grid on
subplot(2,2,2); stem(nhi:nhf,h,'b');title('Discrete System');xlabel('n');ylabel('h(n)');grid on
subplot(2,2,3); stem(nyi:nyf,y, 'r');title('Output Signal');xlabel('n');ylabel('y(n)');grid on
subplot(2,2,4); stem(nyi:nyf,ErrorConv, 'm'); title('Error Conv');xlabel('n');ylabel('Error');grid on


