function varargout = BasicGUI(varargin)
% BASICGUI MATLAB code for BasicGUI.fig
%      BASICGUI, by itself, creates a new BASICGUI or raises the existing
%      singleton*.
%
%      H = BASICGUI returns the handle to a new BASICGUI or the handle to
%      the existing singleton*.
%
%      BASICGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BASICGUI.M with the given input arguments.
%
%      BASICGUI('Property','Value',...) creates a new BASICGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BasicGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BasicGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BasicGUI

% Last Modified by GUIDE v2.5 07-Nov-2019 11:59:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BasicGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @BasicGUI_OutputFcn, ...
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


% --- Executes just before BasicGUI is made visible.
function BasicGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BasicGUI (see VARARGIN)

%dataset 1
handles.peaks = peaks(35);

%dataset 2
handles.membrane = membrane;

%dataset 3

[x,y] = meshgrid(-8:.5:8);
r = sqrt(x.^2+y.^2)+eps;
sinc = sin(r)./r;
handles.sinc = sinc;

handles.currentData = handles.peaks;
surf(handles.currentData)


% Choose default command line output for BasicGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BasicGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = BasicGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in Funcion_X1.
function Funcion_X1_Callback(hObject, eventdata, handles)
% hObject    handle to Funcion_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
val = get(hObject, 'Value');

switch str{val}
    case 'peaks'
        handles.currentData = handles.peaks;
    case 'membrane'
        handles.currentData = handles.membrane;
    case 'sinc'
        handles.currentData = handles.sinc;
        
end
%save handles structure
guidata(hObject,handles)
        
      
        



% Hints: contents = cellstr(get(hObject,'String')) returns Funcion_X1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Funcion_X1


% --- Executes during object creation, after setting all properties.
function Funcion_X1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Funcion_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: funcion_x1 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Graficar_Pushbutton1.
function Graficar_Pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to Graficar_Pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc; clearvars; close all;

% Se�al Impulso
A= get(handles.Edit_Amp_X1,'String'); % Amplitud
ni=get(handles.Edit_ni_X1,'String'); %Instante de inicio
nf=get(handles.Edit_nf_X1,'String');  % Instante final
x=A*[zeros(1,abs(ni)) 1 zeros(1,abs(nf))]; % Se�al impulso
n=ni:nf;  % Instantes de tiempo
stem(n,x); xlabel('n'); ylabel('x(n)'); title('Se�al Impulso');grid on

% --- Executes on button press in Graficar_Pushbutton3.
function Graficar_Pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to Graficar_Pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mesh(handles.currentData);

% --- Executes on button press in Contour_Pushbutton.
function Contour_Pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to Contour_Pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
contour(handles.currentData);



function Edit_Amp_X1_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_Amp_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of Edit_Amp_X1 as text
%        str2double(get(hObject,'String')) returns contents of Edit_Amp_X1 as a double


% --- Executes during object creation, after setting all properties.
function Edit_Amp_X1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_Amp_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_ni_X1_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_ni_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_ni_X1 as text
%        str2double(get(hObject,'String')) returns contents of Edit_ni_X1 as a double


% --- Executes during object creation, after setting all properties.
function Edit_ni_X1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_ni_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Operacion.
function Operacion_Callback(hObject, eventdata, handles)
% hObject    handle to Operacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Operacion contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Operacion


% --- Executes during object creation, after setting all properties.
function Operacion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Operacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: funcion_x1 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Graficar_Pushbutton2.
function Graficar_Pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to Graficar_Pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Funcion_X2.
function Funcion_X2_Callback(hObject, eventdata, handles)
% hObject    handle to Funcion_X2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Funcion_X2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Funcion_X2


% --- Executes during object creation, after setting all properties.
function Funcion_X2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Funcion_X2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: funcion_x1 controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_nf_X1_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_nf_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_nf_X1 as text
%        str2double(get(hObject,'String')) returns contents of Edit_nf_X1 as a double


% --- Executes during object creation, after setting all properties.
function Edit_nf_X1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_nf_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_no_X1_Callback(hObject, eventdata, handles)
% hObject    handle to Edit_no_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_no_X1 as text
%        str2double(get(hObject,'String')) returns contents of Edit_no_X1 as a double


% --- Executes during object creation, after setting all properties.
function Edit_no_X1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Edit_no_X1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
