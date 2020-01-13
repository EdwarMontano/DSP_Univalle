
a = audiorecorder(44100,16,1); %por ahora esta como en CD, la idea es dejar igual audio y microfono. luego cambiar
f = msgbox('grabando');
recordblocking(a, 15);
delete(f);
pause(0.01);
f = msgbox('fin de la grabacion');
pause(1.3);
delete(f);
global xmic;
global fsmic;
xmic=transpose(getaudiodata(a));
fsmic = 44100;
global xmic_inv;
xmic_inv = fliplr(xmic);
global xmic_fft;
xmic_fft = fft(xmic);
global xmic_player;
xmic_player = audioplayer(xmic,fsmic);
global xmic_inv_player;
xmic_inv_player = audioplayer(xmic_inv,fsmic);



%adquirir archivo, guardarlo en un vector, invertirlo y hacerle fft
[file,path] = uigetfile('*.wav','Seleccione un archivo de sonido');
[loadwav,fswav_aux] = audioread([path file]);%loadwav guarda todo, xwav solo la parte que mide lo mismo que xmic
global xwav;
xwav = loadwav(1:15*44100);
global fswav;
fswav = fswav_aux;
global xwav_inv;
xwav_inv = fliplr(xwav);
global xwav_fft;
xwav_fft = fft(xwav);
global xwav_player;
xwav_player = audioplayer(xwav,fswav);
global xwav_inv_player; %este es al reves
xwav_inv_player = audioplayer(xwav_inv,fswav);