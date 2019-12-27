clc; clearvars; close all;


% Introducir parámetros señal CHIRP

dlgtitle = 'Chirp Signal Parametres';
prompt = {'Frecuencia Inicial(Hz):','Frecuencia Final(Hz)','Instante Inicial(s):','Instante Final(s):' };
dims = [1 35];
defect_input = {'0','10000', '0', '100'};
answer = inputdlg(prompt,dlgtitle,dims,defect_input);
            
fini=str2num(answer{1});
ffin=str2num(answer{2});
tini=str2num(answer{3});
tfin=str2num(answer{4});


% Introducir método de variación ferecuencia en señal chirp
metodo= questdlg('Seleccione Variación Frecuencia Chirp ','Variación Frecuencia','linear', 'quadratic', 'logaritmic','linear' );

% Parámetros muestreo
dlgtitle = 'Sample Parametres';
prompt = {'Frecuencia de muestreo(Hz):'};
dims = [1 35];
frec=5*max([fini  ffin]);
defect_input = {num2str(frec)};
answer = inputdlg(prompt,dlgtitle,dims,defect_input);
Fs=str2num(answer{1});


fase=pi/2;

T_tot=tfin-tini+1;
Lx=T_tot*Fs;

nx= 0:Lx;

t=tini:1/Fs :tfin;


x = chirp(t,fini,tfin,ffin,metodo,fase);
%x = cos(2*pi*f1*t);


subplot(2,2,1); plot(t, x, '-o'); title('x(n)');ylim([-1.5  1.5])

X=fft(x);
%Xmag=2*abs(X/Lx);
Xmag=2*abs(X);

fx = nx*Fs/Lx;


subplot(2,2,2); plot(fx(1:Lx/2), Xmag(1:Lx/2)) ; title('X(w)');


% Filtrado
%Diseño Filtro Band Stop
F_BS = designfilt('bandstopiir','FilterOrder',16, ...
         'HalfPowerFrequency1',4000,'HalfPowerFrequency2',6000, ...
         'SampleRate',Fs);
%fvtool(F_BandStop)



y=filter(F_BS,x);
Ly=length(y);
Y=fft(y);
Ymag=2*abs(Y/Ly);

%fy = Fs/Ly;
ny= 0:Ly-1;
fy = ny*Fs/Ly;


subplot(2,2,3); plot(fy, y); title('y(n)');


subplot(2,2,4); plot(fy(1:Ly/2), Ymag(1:Ly/2)); title('Y(w)');


