function varargout = pruebasonido(varargin)
% PRUEBASONIDO MATLAB code for pruebasonido.fig
%      PRUEBASONIDO, by itself, creates a new PRUEBASONIDO or raises the existing
%      singleton*.
%
%      H = PRUEBASONIDO returns the handle to a new PRUEBASONIDO or the handle to
%      the existing singleton*.
%
%      PRUEBASONIDO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRUEBASONIDO.M with the given input arguments.
%
%      PRUEBASONIDO('Property','Value',...) creates a new PRUEBASONIDO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pruebasonido_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pruebasonido_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pruebasonido

% Last Modified by GUIDE v2.5 27-Feb-2019 14:32:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pruebasonido_OpeningFcn, ...
                   'gui_OutputFcn',  @pruebasonido_OutputFcn, ...
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


% --- Executes just before pruebasonido is made visible.
function pruebasonido_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pruebasonido (see VARARGIN)

% Choose default command line output for pruebasonido
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pruebasonido wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pruebasonido_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.figure1);
[file,path] = uigetfile('*.wav','Seleccione un archivo de sonido');
[x,fs] = audioread([path file]);
myGui.freqSam=fs;
myGui.datasound=x;
myGui.player=audioplayer(myGui.datasound,myGui.freqSam);
myGui.flag=2;
set(handles.text3,'String',[path file]);
guidata(handles.figure1,myGui)


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.figure1);
if(myGui.flag==2)
    myGui.flag=1;
    disp('2');
    play(myGui.player);
else
    if(myGui.flag == 1)
        disp('1');
        myGui.flag=0;
        pause(myGui.player);
    else
        disp('0');
        myGui.flag=1;
        resume(myGui.player)
    end
end
guidata(handles.figure1,myGui);

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myGui=guidata(handles.figure1);
myGui.flag=2;
stop(myGui.player);
guidata(handles.figure1,myGui);


% --- Executes during object creation, after setting all properties.
function load_CreateFcn(hObject, eventdata, handles)
% hObject    handle to load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
