global fswav;

[file,path] = uigetfile('*.mp3','Seleccione un archivo de sonido');
[loadwav_aux,fswav_aux] = audioread([path file]);

%%resampling y downsampling

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
xwav = single(loadwav(1:15*16000)); %se pasa de double a single para reducir el costo computacional
global xwav2; %xwav2 es el segundo canal
xwav2aux= single(loadwav(2:15*16000));
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
xwav_player = audioplayer(xwav,fswav);
myGui.xwav_player = xwav_player;
myGui.xwav_inv_player = audioplayer(xwav_inv,fswav);
myGui.xwav_estereo_player = audioplayer(xwav_estereo,fswav);
myGui.xwav_estereo_inv_player = audioplayer(xwav_estereo_inv,fswav);
xwav_estereo_fft = fft(xwav_estereo);
myGui.xwav_estereo_fft = xwav_estereo_fft


%coeficientes filtro pasobajo, se aplica a ambos canales
%%b = [0.0985 0.2956 0.2956,0.0985];
%%a = [1 -0.5772 0.4218 -0.0563];
xwav_pasobajo_iir = [];
xwav_pasobajo_iir(1) = 0;  %matlab indexa desde 1
xwav_pasobajo_iir(2) = 0;  
xwav_pasobajo_iir(3) = 0;

for n = 4:240000;
    xwav_pasobajo_iir(n) = 0.0985*xwav(n)+0.2956*xwav(n-1)+0.2956*xwav(n-2)+0.0985*xwav(n-3)+0.5772*xwav_pasobajo_iir(n-1)-0.4218*xwav_pasobajo_iir(n-2)+0.0563*xwav_pasobajo_iir(n-3);
end;

xwav2_pasobajo_iir = [];
xwav2_pasobajo_iir(1) = 0;  %matlab indexa desde 1
xwav2_pasobajo_iir(2) = 0;  
xwav2_pasobajo_iir(3) = 0;

for n = 4:240000;
    xwav2_pasobajo_iir(n) = 0.0985*xwav2(n)+0.2956*xwav2(n-1)+0.2956*xwav2(n-2)+0.0985*xwav2(n-3)+0.5772*xwav2_pasobajo_iir(n-1)-0.4218*xwav2_pasobajo_iir(n-2)+0.0563*xwav2_pasobajo_iir(n-3);
end;

xwav_estereo_pasobajo_iir = vertcat(xwav_pasobajo_iir,xwav2_pasobajo_iir);
xwav_estereo_pasobajo_iir_inv = fliplr(xwav_estereo_pasobajo_iir);
xwav_estereo_pasobajo_iir_player = audioplayer(xwav_estereo_pasobajo_iir,fswav);
xwav_estereo_pasobajo_iir_inv_player = audioplayer(xwav_estereo_pasobajo_iir_inv,fswav);







