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

% Last Modified by GUIDE v2.5 04-Mar-2019 16:49:49

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
myGui.xmic_player = audioplayer(xmic,fsmic);
myGui.xmic_inv_player = audioplayer(xmic_inv,fsmic);
axes(handles.axes_mic);
plot(xmic);
axes(handles.axes_micfftabs);
plot(abs(xmic_fft));
axes(handles.axes_micfftang);
plot(angle(xmic_fft));
myGui.flagPlay = 2;
guidata(handles.mi_interfaz,myGui);


% --- Executes on button press in boton_cargar.
function boton_cargar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

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
myGui.xwav_player = audioplayer(xwav,fswav);
myGui.xwav_inv_player = audioplayer(xwav_inv,fswav);
axes(handles.axes_wav);
plot(xwav);
axes(handles.axes_wavfftabs);
plot(abs(xwav_fft));
axes(handles.axes_wavfftang);
plot(angle(xwav_fft));
myGui.flagPlay = 2;
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

if reversa == 0
    play(myGui.xmic_player);
elseif reversa == 1
    play(myGui.xmic_inv_player);
end;
   

guidata(handles.mi_interfaz,myGui);


% --- Executes on button press in parar_mic.
function parar_mic_Callback(hObject, eventdata, handles)
% hObject    handle to parar_mic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

reversa = get(handles.radio_inverso,'Value');

if reversa == 0
    stop(myGui.xmic_player);
elseif reversa == 1
    stop(myGui.xmic_inv_player);
end;
   

guidata(handles.mi_interfaz,myGui);



% --- Executes on button press in play_wav.
function play_wav_Callback(hObject, eventdata, handles)
% hObject    handle to play_wav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

reversa = get(handles.radio_inverso,'Value');

if reversa == 0
    play(myGui.xwav_player);
elseif reversa == 1
    play(myGui.xwav_inv_player);
end;

guidata(handles.mi_interfaz,myGui);



% --- Executes on button press in parar_wav.
function parar_wav_Callback(hObject, eventdata, handles)
% hObject    handle to parar_wav (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.mi_interfaz);

reversa = get(handles.radio_inverso,'Value');

if reversa == 0
    stop(myGui.xwav_player);
elseif reversa == 1
    stop(myGui.xwav_inv_player);
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


vol=num2str(round(get(hObject,'Value')));

s1='nircmd.exe setsysvolume';
s2=' ';
s3=vol;
texto=strcat(s1,s2,s3);
system(texto);

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
