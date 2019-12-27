function varargout = suma(varargin)
% SUMA MATLAB code for suma.fig
%      SUMA, by itself, creates a new SUMA or raises the existing
%      singleton*.
%
%      H = SUMA returns the handle to a new SUMA or the handle to
%      the existing singleton*.
%
%      SUMA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUMA.M with the given input arguments.
%
%      SUMA('Property','Value',...) creates a new SUMA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before suma_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to suma_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help suma

% Last Modified by GUIDE v2.5 19-Feb-2019 21:28:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @suma_OpeningFcn, ...
                   'gui_OutputFcn',  @suma_OutputFcn, ...
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


% --- Executes just before suma is made visible.
function suma_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to suma (see VARARGIN)

% Choose default command line output for suma
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes suma wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = suma_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in boton_suma.
function boton_suma_Callback(hObject, eventdata, handles)
% hObject    handle to boton_suma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% aqui se escribe el codigo de la funcion
%funcion
%se crea la variable a y se le asigna la entrada del sumando_1
a = str2double(get(handles.sumando_1,'string')); 
%se hace lo mismo para el sumando_2
b = str2double(get(handles.sumando_2,'string'));
%se realiza la operacion
c = a+b;
%se le asigna el valor de c a la caja del resultado
set(handles.resultado_box,'string',num2str(c));
%end:funcion



function sumando_1_Callback(hObject, eventdata, handles)
% hObject    handle to sumando_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sumando_1 as text
%        str2double(get(hObject,'String')) returns contents of sumando_1 as a double


% --- Executes during object creation, after setting all properties.
function sumando_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumando_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sumando_2_Callback(hObject, eventdata, handles)
% hObject    handle to sumando_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sumando_2 as text
%        str2double(get(hObject,'String')) returns contents of sumando_2 as a double


% --- Executes during object creation, after setting all properties.
function sumando_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sumando_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultado_box_Callback(hObject, eventdata, handles)
% hObject    handle to resultado_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultado_box as text
%        str2double(get(hObject,'String')) returns contents of resultado_box as a double


% --- Executes during object creation, after setting all properties.
function resultado_box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultado_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
