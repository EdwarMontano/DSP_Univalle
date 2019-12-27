%clc; clearvars; %close all;
% ILUSTRACIÓN FENOMENO DE GIBBS

% Señal Sinc
% Entrar rango N de instantes para generar x(n)  -N <= n <= N
prompt = {'Rango  N:', 'wc:' };
dlg_title = 'Parámetros para x(n)= sinc(wc)';
num_lines = 1;
defaultans = {'50','pi/5' };
Ndat = inputdlg(prompt,dlg_title,num_lines,defaultans);
N=str2num(Ndat{1});
wc=str2num(Ndat{2});

% Generar x(n)
n1=[-N:-1];
n2=[1:N];
x= [sin(wc.*n1)./(pi*n1)   wc/pi   sin(wc.*n2)./(pi*n2)];
nt= [n1 0 n2];

% Obtener la Transformada de Fourier Aproximada
delta=2*pi/1000;
W=[-pi/2:delta:pi/2]; %Valores frecuencia
Lw=length(W);
X=zeros(1,Lw);
k=0;
for w=-pi/2:delta:(pi/2)
    k=k+1;
    tempo=0;    
    for n=-N:-1
        m=n+N+1; %cambio variable ajustar rango de vectores matlab
        tempo=tempo + x(m)*exp(-1i* w*n);
    end
    
    for n=1:N
        m=n+N+1; %cambio variable ajustar rango de vectores matlab
        tempo=tempo + x(m)*exp(-1i* w*n);
    end
    X(k)=tempo+wc/pi; %agregar el valor para n=o
end

% Visualización
subplot(2,1,1);plot(nt,x, 'b *'); xlabel('n'); ylabel('x(n)');
title(['Señal Sinc, wc='  num2str(wc/pi) 'x pi']);grid on

subplot(2,1,2);plot(W,real(X),'r '); xlabel('w'); ylabel('X(w)');
title([ 'Transformada Fourier,  N='  num2str(N)] ); grid on



