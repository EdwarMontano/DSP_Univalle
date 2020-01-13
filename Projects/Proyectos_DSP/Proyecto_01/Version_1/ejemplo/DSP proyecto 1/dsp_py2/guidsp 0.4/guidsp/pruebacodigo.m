global fswav;

[file,path] = uigetfile('*.mp3','Seleccione un archivo de sonido');
[loadwav_aux,fswav_aux] = audioread([path file]);

if fswav_aux == 32000
    loadwav = downsample(loadwav_aux,2);
    fswav = 16000;
elseif fswav_aux == 48000
    loadwav = downsample(loadwav_aux,3);
    fswav = 16000; 
elseif fswav_aux == 44100
    [p,q] = rat(48000/44100);
    loadwav0 = resample(loadwav_aux,p,q);
    loadwav = downsample(loadwav0,3);
    fswav = 16000;
end;

global xwav;
xwav = 1*((loadwav(1:15*16000)));
global xwav2; %xwav2 es el segundo canal
xwav2aux=1*(loadwav(2:15*16000));
cero = [0];
xwav2 = horzcat(xwav2aux,cero);
global xwav_inv;
xwav_inv = fliplr(xwav);
global xwav_fft;
xwav_fft = (1/240000)*(fft(xwav));
global xwav2_fft;
xwav2_fft = (1/240000)*(fft(xwav2));
xwav_estereo = vertcat(xwav,xwav2);
xwav_estereo_inv = fliplr(xwav_estereo);
myGui.xwav_player = audioplayer(xwav,fswav);
myGui.xwav_inv_player = audioplayer(xwav_inv,fswav);
myGui.xwav_estereo_player = audioplayer(xwav_estereo,fswav);
myGui.xwav_estereo_inv_player = audioplayer(xwav_estereo_inv,fswav);
xwav_estereo_fft = fft(xwav_estereo);
myGui.xwav_estereo_fft = xwav_estereo_fft

%se definen los filtros y se filtra por separado cada canal
%coeficientes filtro pasobajo
b = [0.0985 0.2956 0.2956,0.0985];
a = [1 -0.5772 0.4218 -0.0563];

pasobajowav_iir = filter(b,a,xwav);
pasobajowav_iir_player = audioplayer(pasobajowav_iir,fswav);

%coeficientes filtro pasoalto
b1 = [0.2569 -0.7707 0.7707 -0.2569];
a1 = [1 -0.5772 0.4218 -0.0563];

pasoaltowav_iir = filter(b1,a1,xwav);

pasoaltowav_iir_player = audioplayer(pasoaltowav_iir,fswav);



