function [Data_audio,Fs] =Record_Audio(answer_Modo)

switch answer_Modo
    case 'Mono'
        disp([answer_Modo ' coming right up.'])
        Modo = 1;
    case 'Stereo'
        disp([answer_Modo ' coming right up.'])
        Modo = 2;
        
end
text_Caja={ 'Segundos grabaci�n:','Frecuencia Muestreo'};
title_caja='Grabaci�n';
num_lines = 1;
defaultans = {'5','44100'};
caja =inputdlg(text_Caja,title_caja,num_lines,defaultans);

T_record=str2num(caja{1});%duraci�n
Fs=str2num(caja{2});%frecuencia de muestreo
grabar= audiorecorder(Fs,8,Modo);
recordblocking(grabar,T_record)
Data_audio = getaudiodata(grabar);
%sound(Data_audio,Fs);
%reproductor = audioplayer(Data_audio,Fs);
%play(reproductor)
end

