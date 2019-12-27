function varargout = interfaz(varargin)
% INTERFAZ MATLAB code for interfaz.fig
%      INTERFAZ, by itself, creates a new INTERFAZ or raises the existing
%      singleton*.
%
%      H = INTERFAZ returns the handle to a new INTERFAZ or the handle to
%      the existing singleton*.
%
%      INTERFAZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZ.M with the given input arguments.
%
%      INTERFAZ('Property','Value',...) creates a new INTERFAZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfaz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfaz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfaz

% Last Modified by GUIDE v2.5 06-Mar-2019 22:33:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfaz_OpeningFcn, ...
                   'gui_OutputFcn',  @interfaz_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before interfaz is made visible.
function interfaz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfaz (see VARARGIN)

% Choose default command line output for interfaz
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfaz wait for user response (see UIRESUME)
% uiwait(handles.mi_interfaz);


% --- Outputs from this function are returned to the command line.
function varargout = interfaz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%SE DEFINEN VARIABLES GLOBALES


% --- Executes on button press in boton_grabar.
function boton_grabar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_grabar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

vol = get(handles.volumen,'Value');

a = audiorecorder(16000,16,1);
f = msgbox('grabando');
recordblocking(a, 15);
delete(f);
pause(0.01);
f = msgbox('fin de la grabacion');
pause(1.3);
delete(f);
global xmic;
global xmic2;
global fsmic;
xmic_aux = transpose(getaudiodata(a));
xmic=vol*xmic_aux;
xmic2=vol*xmic_aux;
fsmic = 16000;
global xmic_inv;
xmic_inv = fliplr(xmic);
global xmic_fft;
xmic_fft = fft(xmic);
myGui.xmic_player = audioplayer(xmic,fsmic);
myGui.xmic_inv_player = audioplayer(xmic_inv,fsmic);
%se hace el "estereo" player y se hace fft 
xmic_estereo = vertcat(xmic,xmic2);
xmic_estereo_inv = fliplr(xmic_estereo);
myGui.xmic_estereo_player = audioplayer(xmic_estereo,fsmic);
myGui.xmic_estereo_inv_player = audioplayer(xmic_estereo_inv, fsmic);
myGui.xmic_estereo_fft = fft(xmic_estereo);

%se usan los filtros:

pasobajo_fir = fir1(239999,0.1);
pasobajo_fir_fft = fft(pasobajo_fir);

pasobanda_fir = fir1(239999,[0.1 0.4]);
pasobanda_fir_fft = fft(pasobanda_fir);

pasoalto_fir_aux = fir1(239999,0.45,'high')
pasoalto_fir = pasoalto_fir_aux(1:240000);
pasoalto_fir_fft = fft(pasoalto_fir);

xmicpasobajo = ifft(xmic_fft .* pasobajo_fir_fft);
xmicpasobajo_inv = fliplr(xmicpasobajo);
xmicpasobajo2 = xmicpasobajo;
xmic_estereo_pasobajo = vertcat(xmicpasobajo,xmicpasobajo2);
xmic_estereo_pasobajo_inv = fliplr(xmic_estereo_pasobajo);
myGui.xmic_estereo_pasobajo_player = audioplayer(xmic_estereo_pasobajo,fsmic);
myGui.xmic_estereo_pasobajo_inv_player = audioplayer(xmic_estereo_pasobajo_inv,fsmic);
myGui.xmicpasobajo_inv_player = audioplayer(xmicpasobajo_inv,fsmic);
myGui.xmicpasobajo = audioplayer(xmicpasobajo,fsmic);

xmicpasobanda = ifft(xmic_fft .* pasobanda_fir_fft);
xmicpasobanda_inv = fliplr(xmicpasobanda);
xmicpasobanda2 = xmicpasobanda;
xmic_estereo_pasobanda = vertcat(xmicpasobanda,xmicpasobanda2);
xmic_estereo_pasobanda_inv = fliplr(xmic_estereo_pasobanda);
myGui.xmic_estereo_pasobanda_player = audioplayer(xmic_estereo_pasobanda,fsmic);
myGui.xmic_estereo_pasobanda_inv_player = audioplayer(xmic_estereo_pasobanda_inv,fsmic);
myGui.xmicpasobanda = audioplayer(xmicpasobanda,fsmic);
myGui.xmicpasobanda_inv = audioplayer(xmicpasobanda_inv,fsmic);

xmicpasoalto = ifft(xmic_fft .* pasoalto_fir_fft);
xmicpasoalto_inv = fliplr(xmicpasoalto);
xmicpasoalto2 = xmicpasoalto;
xmic_estereo_pasoalto = vertcat(xmicpasoalto,xmicpasoalto2);
xmic_estereo_pasoalto_inv = fliplr(xmic_estereo_pasoalto);
myGui.xmic_estereo_pasoalto_player = audioplayer(xmic_estereo_pasoalto,fsmic);
myGui.xmic_estereo_pasoalto_inv = audioplayer(xmic_estereo_pasoalto_inv,fsmic);
myGui.xmicpasoalto = audioplayer(xmicpasoalto,fsmic);

axes(handles.axes_mic);
plot(xmic);
axes(handles.axes_micfftabs);
plot(abs(xmic_fft));
axes(handles.axes_micfftang);
plot(angle(xmic_fft));
axes(handles.axes9);




guidata(handles.mi_interfaz,myGui);


% --- Executes on button press in boton_cargar.
function boton_cargar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

vol = double(get(handles.volumen,'Value'));

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
xwav = vol*((loadwav(1:15*16000)));
global xwav2; %xwav2 es el segundo canal
xwav2aux=vol*(loadwav(2:15*16000));
cero = [0];
xwav2 = horzcat(xwav2aux,cero);
global xwav_inv;
xwav_inv = fliplr(xwav);
global xwav_fft;
xwav_fft = fft(xwav);
global xwav2_fft;
xwav2_fft = fft(xwav2);
xwav_estereo = vertcat(xwav,xwav2);
xwav_estereo_inv = fliplr(xwav_estereo);
myGui.xwav_player = audioplayer(xwav,fswav);
myGui.xwav_inv_player = audioplayer(xwav_inv,fswav);
myGui.xwav_estereo_player = audioplayer(xwav_estereo,fswav);
myGui.xwav_estereo_inv_player = audioplayer(xwav_estereo_inv,fswav);
xwav_estereo_fft = fft(xwav_estereo);
myGui.xwav_estereo_fft = xwav_estereo_fft

%se definen los filtros y se filtra por separado cada canal

pasobajo_fir = fir1(239999,0.1);
pasobajo_fir_fft = fft(pasobajo_fir);

pasobanda_fir = fir1(239999,[0.1 0.4]);
pasobanda_fir_fft = fft(pasobanda_fir);

pasoalto_fir_aux = fir1(239999,0.45,'high')
pasoalto_fir = pasoalto_fir_aux(1:240000);
pasoalto_fir_fft = fft(pasoalto_fir);


xwavpasobajo = ifft(xwav_fft .* pasobajo_fir_fft);
xwav2pasobajo = ifft(xwav2_fft .* pasobajo_fir_fft);
xwav_estereo_pasobajo = vertcat(xwavpasobajo,xwav2pasobajo);
myGui.xwav_estereo_pasobajo_player = audioplayer(xwav_estereo_pasobajo,fswav);

xwavpasobanda = ifft(xwav_fft .* pasobanda_fir_fft);
xwav2pasobanda = ifft(xwav2_fft .* pasobanda_fir_fft);
xwav_estereo_pasobanda = vertcat(xwavpasobanda,xwav2pasobanda);
myGui.xwav_estereo_pasobanda_player = audioplayer(xwav_estereo_pasobanda,fswav);

xwavpasoalto = ifft(xwav_fft .* pasoalto_fir_fft);
xwav2pasoalto = ifft(xwav2_fft .* pasoalto_fir_fft);
xwav_estereo_pasoalto = vertcat(xwavpasoalto,xwav2pasoalto);
myGui.xwav_estereo_pasoalto_player = audioplayer(xwav_estereo_pasoalto,fswav);

axes(handles.axes_wav);
plot(xwav);
axes(handles.axes_wavfftabs);
plot(abs(xwav_fft));
axes(handles.axes_wavfftang);
plot(angle(xwav_fft));

myGui.xwav = xwav;
myGui.xwav_fft = xwav_fft;

guidata(handles.mi_interfaz,myGui);


% --- Executes when selected object is changed in panel_play.
function panel_play_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in panel_play 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

guidata(handles.mi_interfaz,myGui);


% --- Executes on button press in play_mic.
function play_mic_Callback(hObject, eventdata, handles)
% hObject    handle to play_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

reversa = get(handles.radio_inverso,'Value');
estereo = get(handles.radio_estereo,'Value');

if (reversa == 0) && (estereo == 0)
    play(myGui.xmic_player);
elseif (reversa == 0) && (estereo == 1)
    play(myGui.xmic_estereo_player);
elseif (reversa == 1) && (estereo == 0)
    play(myGui.xmic_inv_player);
elseif (reversa == 1) && (estereo == 1)
    play(myGui.xmic_estereo_inv_player);
end;
   

guidata(handles.mi_interfaz,myGui);


% --- Executes on button press in parar_mic.
function parar_mic_Callback(hObject, eventdata, handles)
% hObject    handle to parar_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

reversa = get(handles.radio_inverso,'Value');
estereo = get(handles.radio_estereo,'Value');

if (reversa == 0) && (estereo == 0)
    stop(myGui.xmic_player);
elseif (reversa == 0) && (estereo == 1)
    stop(myGui.xmic_estereo_player);
elseif (reversa == 1) && (estereo == 0)
    stop(myGui.xmic_inv_player);
elseif (reversa == 1) && (estereo == 1)
    stop(myGui.xmic_estereo_inv_player);
end;
   
   

guidata(handles.mi_interfaz,myGui);



% --- Executes on button press in play_wav.
function play_wav_Callback(hObject, eventdata, handles)
% hObject    handle to play_wav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

reversa = get(handles.radio_inverso,'Value');
estereo = get(handles.radio_estereo,'Value');

if (reversa == 0) && (estereo == 0)
    play(myGui.xwav_player);
elseif (reversa == 0) && (estereo == 1)
    play(myGui.xwav_estereo_player);
elseif (reversa == 1) && (estereo == 0)
    play(myGui.xwav_inv_player);
elseif (reversa == 1) && (estereo == 1)
    play(myGui.xwav_estereo_inv_player);
end;


guidata(handles.mi_interfaz,myGui);



% --- Executes on button press in parar_wav.
function parar_wav_Callback(hObject, eventdata, handles)
% hObject    handle to parar_wav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

reversa = get(handles.radio_inverso,'Value');
estereo = get(handles.radio_estereo,'Value');

if (reversa == 0) && (estereo == 0)
    stop(myGui.xwav_player);
elseif (reversa == 0) && (estereo == 1)
    stop(myGui.xwav_estereo_player);
elseif (reversa == 1) && (estereo == 0)
    stop(myGui.xwav_inv_player);
elseif (reversa == 1) && (estereo == 1)
    stop(myGui.xwav_estereo_inv_player);
end;


guidata(handles.mi_interfaz,myGui);


% --- Executes on button press in radio_inverso.
function radio_inverso_Callback(hObject, eventdata, handles)
% hObject    handle to radio_inverso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_inverso


% --- Executes on slider movement.
function volumen_Callback(hObject, eventdata, handles)
% hObject    handle to volumen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

myGui=guidata(handles.mi_interfaz);

vol = get(handles.volumen,'Value');
disp(vol);

guidata(handles.mi_interfaz,myGui);


% --- Executes during object creation, after setting all properties.
function volumen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volumen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radio_estereo.
function radio_estereo_Callback(hObject, eventdata, handles)
% hObject    handle to radio_estereo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_estereo


% --- Executes on button press in playout_mic.
function playout_mic_Callback(hObject, eventdata, handles)
% hObject    handle to playout_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stopout_mic.
function stopout_mic_Callback(hObject, eventdata, handles)
% hObject    handle to stopout_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radio_band.
function radio_band_Callback(hObject, eventdata, handles)
% hObject    handle to radio_band (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_band


% --- Executes on button press in radio_high.
function radio_high_Callback(hObject, eventdata, handles)
% hObject    handle to radio_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_high


% --- Executes on button press in radio_low.
function radio_low_Callback(hObject, eventdata, handles)
% hObject    handle to radio_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_low
