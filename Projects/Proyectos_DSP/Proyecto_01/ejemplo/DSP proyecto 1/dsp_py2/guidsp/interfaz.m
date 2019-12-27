
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

% Last Modified by GUIDE v2.5 08-Mar-2019 13:31:56

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

global xmic_fft;
global xmic;
global xmic2;
global fsmic;
global xmic_inv;

vol = get(handles.volumen,'Value');

a = audiorecorder(16000,16,1);
f = msgbox('grabando');
recordblocking(a, 15);
delete(f);
pause(0.01);
f = msgbox('fin de la grabacion');
pause(1.3);
delete(f);
xmic_aux = transpose(getaudiodata(a));

xmic=vol*xmic_aux;

xmic2=vol*xmic_aux;

fsmic = 16000;

xmic_inv = fliplr(xmic);
xmic_fft = fft(xmic);
myGui.xmic_player = audioplayer(xmic,fsmic);
myGui.xmic_inv_player = audioplayer(xmic_inv,fsmic);
%se hace el "estereo" player y se hace fft 
xmic_estereo = vertcat(xmic,xmic2);
xmic_estereo_inv = fliplr(xmic_estereo);
myGui.xmic_estereo_player = audioplayer(xmic_estereo,fsmic);
myGui.xmic_estereo_inv_player = audioplayer(xmic_estereo_inv, fsmic);
myGui.xmic_estereo_fft = fft(xmic_estereo);

myGui.xmic = xmic;
myGui.xmic2 = xmic2;
myGui.fsmic = fsmic;
myGui.xmic_inv = xmic_inv;
myGui.xmic_fft = xmic_fft;

%%FIR Microfono

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
myGui.xmicpasobanda_player = audioplayer(xmicpasobanda,fsmic);
myGui.xmicpasobanda_inv_player = audioplayer(xmicpasobanda_inv,fsmic);

xmicpasoalto = ifft(xmic_fft .* pasoalto_fir_fft);
xmicpasoalto_inv = fliplr(xmicpasoalto);
xmicpasoalto2 = xmicpasoalto;
xmic_estereo_pasoalto = vertcat(xmicpasoalto,xmicpasoalto2);
xmic_estereo_pasoalto_inv = fliplr(xmic_estereo_pasoalto);
myGui.xmic_estereo_pasoalto_player = audioplayer(xmic_estereo_pasoalto,fsmic);
myGui.xmic_estereo_pasoalto_inv = audioplayer(xmic_estereo_pasoalto_inv,fsmic);
myGui.xmicpasoalto = audioplayer(xmicpasoalto,fsmic);
myGui.xmicpasoalto_inv_player = audioplayer(xmicpasoalto_inv,fsmic);

%IIR microfono 

%coeficientes filtro pasobajo, se aplica a ambos canales
%%b = [0.0985 0.2956 0.2956,0.0985];
%%a = [1 -0.5772 0.4218 -0.0563];

xmic_pasobajo_iir = [];
xmic_pasobajo_iir(1) = 0;  %matlab indexa desde 1
xmic_pasobajo_iir(2) = 0;  
xmic_pasobajo_iir(3) = 0;

for n = 4:240000;
    xmic_pasobajo_iir(n) = 0.0985*xmic(n)+0.2956*xmic(n-1)+0.2956*xmic(n-2)+0.0985*xmic(n-3)+0.5772*xmic_pasobajo_iir(n-1)-0.4218*xmic_pasobajo_iir(n-2)+0.0563*xmic_pasobajo_iir(n-3);
end;

xmic2_pasobajo_iir = xmic_pasobajo_iir;
xmic_pasobajo_iir_inv = fliplr(xmic_pasobajo_iir);
xmic_estereo_pasobajo_iir = vertcat(xmic_pasobajo_iir,xmic2_pasobajo_iir);
xmic_estereo_pasobajo_iir_inv = fliplr(xmic_estereo_pasobajo_iir);
myGui.xmic_estereo_pasobajo_iir_player = audioplayer(xmic_estereo_pasobajo_iir,fsmic);
myGui.xmic_estereo_pasobajo_iir_inv_player = audioplayer(xmic_estereo_pasobajo_iir_inv,fsmic);
myGui.xmic_pasobajo_iir_player = audioplayer(xmic2_pasobajo_iir,fsmic);
myGui.xmic_pasobajo_iir_inv_player = audioplayer(xmic_pasobajo_iir_inv,fsmic);

%la ED implementada para paso banda y paso alto consume muchos recursos,
%ver pruebacodigo.m

%pasoalto

b1 = [0,2569 -0.7707 0.7707 -0.2569];
a1 = [1 -0.5772 0.4218 -0.0563]

xmic_pasoalto_iir = filter(b1,a1,xmic);
xmic2_pasoalto_iir= xmic_pasoalto_iir;
xmic_estereo_pasoalto_iir = vertcat(xmic_pasoalto_iir,xmic2_pasoalto_iir); 
xmic_estereo_pasoalto_iir_inv = fliplr(xmic_estereo_pasoalto_iir);
xmic_estereo_pasoalto_iir_player = audioplayer(xmic_estereo_pasoalto_iir,fsmic);
xmic_estereo_pasoalto_iir_inv_player = audioplayer(xmic_estereo_pasoalto_iir_inv,fsmic);

%pasobanda 

b2 = [0.0675 0 -0.1349 0 0.0675];
a2 = [1 -1.9425 2.1192 -1.2167 0.4128];

xmic_pasobanda_iir = filter(b2,a2,xmic);
xmic2_pasobanda_iir = xmic_pasobanda_iir;
xmic_estereo_pasobanda_iir = vertcat(xmic2_pasobanda_iir,xmic_pasobanda_iir);
xmic_estereo_pasobanda_iir_inv = fliplr(xmic_estereo_pasobanda_iir);
xmic_estereo_pasobanda_iir_player = audioplayer(xmic_estereo_pasobanda_iir,fsmic);
xmic_estereo_pasobanda_iir_inv_player = audioplayer(xmic_estereo_pasobanda_iir_inv,fsmic);

axes(handles.axes_mic);
plot(xmic);
axes(handles.axes_micfftabs);
plot(abs(xmic_fft));
axes(handles.axes_micfftang);
plot(angle(xmic_fft));

guidata(handles.mi_interfaz,myGui);


% --- Executes on button press in boton_cargar.
function boton_cargar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

global xwav;
global xwav2;
global xwav_inv;
global xwav_fft;
global xwav2_fft;

vol = double(get(handles.volumen,'Value'));

global fswav;
fswav = 16000;

[file,path] = uigetfile('*.mp3','Seleccione un archivo de sonido');
[loadwav_aux,fswav_aux] = audioread([path file]);

if fswav_aux == 32000
    loadwav = downsample(loadwav_aux,2);
elseif fswav_aux == 48000
    loadwav = downsample(loadwav_aux,3); 
elseif fswav_aux == 44100
    [p,q] = rat(48000/44100);
    loadwav0 = resample(loadwav_aux,p,q);
    loadwav = downsample(loadwav0,3);

end;

xwav = vol*((loadwav(1:15*16000)));
xwav2aux=vol*(loadwav(2:15*16000));
cero = [0];
xwav2 = horzcat(xwav2aux,cero);
xwav_inv = fliplr(xwav);

xwav_fft = fft(xwav);

xwav2_fft = fft(xwav2);
xwav_estereo = vertcat(xwav,xwav2);
xwav_estereo_inv = fliplr(xwav_estereo);
myGui.xwav_player = audioplayer(xwav,fswav);
myGui.xwav_inv_player = audioplayer(xwav_inv,fswav);
myGui.xwav_estereo_player = audioplayer(xwav_estereo,fswav);
myGui.xwav_estereo_inv_player = audioplayer(xwav_estereo_inv,fswav);
xwav_estereo_fft = fft(xwav_estereo);
myGui.xwav = xwav;
myGui.xwav2 = xwav2;
myGui.xwav_fft = xwav_fft;
myGui.xwav2_fft = xwav2_fft;
myGui.xwav_estereo_fft = xwav_estereo_fft


%se definen los filtros y se filtra por separado cada canal


%FIR AUDIO

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



%IIR AUDIO

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

xwav_pasobajo_iir_inv = fliplr(xwav_pasobajo_iir)
xwav_estereo_pasobajo_iir = vertcat(xwav_pasobajo_iir,xwav2_pasobajo_iir);
xwav_estereo_pasobajo_iir_inv = fliplr(xwav_estereo_pasobajo_iir);
myGui.xwav_estereo_pasobajo_iir_player = audioplayer(xwav_estereo_pasobajo_iir,fswav);
myGui.xwav_estereo_pasobajo_iir_inv_player = audioplayer(xwav_estereo_pasobajo_iir_inv,fswav);
myGui.xwav_pasobajo_iir_player = audioplayer(xwav_pasobajo_iir,fswav);
myGui.xwav_pasobajo_iir_inv_player = audioplayer(xwav_pasobajo_iir_inv,fswav);

%pasoalto
b3 = [0,2569 -0.7707 0.7707 -0.2569];
a3 = [1 -0.5772 0.4218 -0.0563];

xmp3=xwav;
xmp32=xwav2;

xwav_pasoalto_iir = filter(b3,a3,xmp3);
xwav2_pasoalto_iir = filter([0,2569 -0.7707 0.7707 -0.2569],[1 -0.5772 0.4218 -0.0563],xmp32);

xwav_pasoalto_iir_inv = fliplr(xwav_pasoalto_iir)
xwav_estereo_pasoalto_iir = vertcat(xwav_pasoalto_iir,xwav2_pasoalto_iir);
xwav_estereo_pasoalto_iir_inv = fliplr(xwav_estereo_pasoalto_iir);
myGui.xwav_estereo_pasoalto_iir_player = audioplayer(xwav_estereo_pasoalto_iir,fswav);
myGui.xwav_estereo_pasoalto_iir_inv_player = audioplayer(xwav_estereo_pasoalto_iir_inv,fswav);
myGui.xwav_pasoalto_iir_player = audioplayer(xwav_pasoalto_iir,fswav);
myGui.xwav_pasoalto_iir_inv_player = audioplayer(xwav_pasoalto_iir_inv,fswav);

%pasobanda 

b4 = [0.0675 0 -0.1349 0 0.0675];
a4 = [1 -1.9425 2.1192 -1.2167 0.4128];

xwav_pasobanda_iir = filter(b4,a4,xwav);
xwav2_pasobanda_iir = filter(b4,a4,xwav2);

xwav_pasobanda_iir_inv = fliplr(xwav_pasobanda_iir);

xwav_estereo_pasobanda_iir = vertcat(xwav_pasobanda_iir,xwav2_pasobanda_iir);
xwav_estereo_pasobanda_iir_inv = fliplr(xwav_estereo_pasobanda_iir);
myGui.xwav_pasobanda_iir_player = audioplayer(xwav_pasobanda_iir,fswav);
myGui.xwav_pasobanda_iir_inv_player = audioplayer(xwav_pasobanda_iir_inv,fswav);
myGui.xwav_estereo_pasobanda_iir_inv_player = audioplayer(xwav_estereo_pasobanda_iir_inv,fswav);

axes(handles.axes_mp3);
plot(xwav);
axes(handles.axes_mp3fftabs);
plot(abs(xwav_fft));
axes(handles.axes_mp3fftang);
plot(angle(xwav_fft));


guidata(handles.mi_interfaz,myGui);


% --- Executes when selected object is changed in panel_play.
function panel_play_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in panel_play 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

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


% --- Executes on button press in boton_pestanamic.
function boton_pestanamic_Callback(hObject, eventdata, handles)
% hObject    handle to boton_pestanamic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

set(handles.panel_mic,          'visible','on')  
set(handles.panel_mp3,         'visible','off' )

guidata(handles.mi_interfaz,myGui);


% --- Executes on button press in boton_pestanamp3.
function boton_pestanamp3_Callback(hObject, eventdata, handles)
% hObject    handle to boton_pestanamp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

set(handles.panel_mic,          'visible','off')  
set(handles.panel_mp3,         'visible','on' )

guidata(handles.mi_interfaz,myGui);

% --- Executes on button press in lp_mp3.
function lp_mp3_Callback(hObject, eventdata, handles)
% hObject    handle to lp_mp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stp_mp3.
function stp_mp3_Callback(hObject, eventdata, handles)
% hObject    handle to stp_mp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stop_mic.
function stop_mic_Callback(hObject, eventdata, handles)
% hObject    handle to stop_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

reversa = get(handles.radio_inverso,'value');
estereo = get(handles.radio_estereo,'value');

if (reversa == 0) && (estereo == 0)
    stop(myGui.xmic_player);
elseif(reversa == 0) && (estereo == 1)
    stop(myGui.xmic_estereo_player);
elseif(reversa ==1) && (estereo == 0)
    stop(myGui.xmic_inv_player);
elseif(reversa ==1) && (estereo == 1)
    stop(myGui.xwav_estereo_inv_player);
end;

guidata(handles.mi_interfaz,myGui);

% --- Executes on button press in boton_procesar.
function boton_procesar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_procesar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);





guidata(handles.mi_interfaz,myGui);


% --- Executes on button press in radio_fir.
function radio_fir_Callback(hObject, eventdata, handles)
% hObject    handle to radio_fir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_fir


% --- Executes on button press in radio_iir.
function radio_iir_Callback(hObject, eventdata, handles)
% hObject    handle to radio_iir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_iir


% --- Executes on button press in stp_lp_mic.
function stp_lp_mic_Callback(hObject, eventdata, handles)
% hObject    handle to stp_lp_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in lp_mic.
function lp_mic_Callback(hObject, eventdata, handles)
% hObject    handle to lp_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bp_mic.
function pushbutton54_Callback(hObject, eventdata, handles)
% hObject    handle to bp_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in hp_mic.
function hp_mic_Callback(hObject, eventdata, handles)
% hObject    handle to hp_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stp_bp_mic.
function stp_bp_mic_Callback(hObject, eventdata, handles)
% hObject    handle to stp_bp_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stp_hp_mic.
function stp_hp_mic_Callback(hObject, eventdata, handles)
% hObject    handle to stp_hp_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bp_mic.
function bp_mic_Callback(hObject, eventdata, handles)
% hObject    handle to bp_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton49.
function pushbutton49_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stp_bp_mp3.
function stp_bp_mp3_Callback(hObject, eventdata, handles)
% hObject    handle to stp_bp_mp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stp_hp_mp3.
function stp_hp_mp3_Callback(hObject, eventdata, handles)
% hObject    handle to stp_hp_mp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in play_mp3.
function play_mp3_Callback(hObject, eventdata, handles)
% hObject    handle to play_mp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);
reversa = get(handles.radio_inverso,'value');
estereo = get(handles.radio_estereo,'value');

if (reversa == 0) && (estereo == 0)
    play(myGui.xwav_player);
elseif(reversa == 0) && (estereo == 1)
    play(myGui.xwav_estereo_player);
elseif(reversa ==1) && (estereo == 0)
    play(myGui.xwav_inv_player);
elseif(reversa ==1) && (estereo == 1)
    play(myGui.xwav_estereo_inv_player);
end;

guidata(handles.mi_interfaz,myGui);

% --- Executes on button press in parar_mp3.
function parar_mp3_Callback(hObject, eventdata, handles)
% hObject    handle to parar_mp3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

myGui=guidata(handles.mi_interfaz);
reversa = get(handles.radio_inverso,'value');
estereo = get(handles.radio_estereo,'value');

if (reversa == 0) && (estereo == 0)
    stop(myGui.xwav_player);
elseif(reversa == 0) && (estereo == 1)
    stop(myGui.xwav_estereo_player);
elseif(reversa ==1) && (estereo == 0)
    stop(myGui.xwav_inv_player);
elseif(reversa ==1) && (estereo == 1)
    stop(myGui.xwav_estereo_inv_player);
end;

guidata(handles.mi_interfaz,myGui);


% --- Executes on button press in play_mic.
function play_mic_Callback(hObject, eventdata, handles)
% hObject    handle to play_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

reversa = get(handles.radio_inverso,'value');
estereo = get(handles.radio_estereo,'value');

if (reversa == 0) && (estereo == 0)
    play(myGui.xmic_player);
elseif(reversa == 0) && (estereo == 1)
    play(myGui.xmic_estereo_player);
elseif(reversa ==1) && (estereo == 0)
    play(myGui.xmic_inv_player);
elseif(reversa ==1) && (estereo == 1)
    play(myGui.xmic_estereo_inv_player);
end;

guidata(handles.mi_interfaz,myGui);
