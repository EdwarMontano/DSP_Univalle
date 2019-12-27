function varargout = senales1(varargin)
% SENALES1 MATLAB code for senales1.fig
%      SENALES1, by itself, creates a new SENALES1 or raises the existing
%      singleton*.
%
%      H = SENALES1 returns the handle to a new SENALES1 or the handle to
%      the existing singleton*.
%
%      SENALES1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SENALES1.M with the given input arguments.
%
%      SENALES1('Property','Value',...) creates a new SENALES1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before senales1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to senales1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help senales1

% Last Modified by GUIDE v2.5 01-May-2014 18:40:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @senales1_OpeningFcn, ...
                   'gui_OutputFcn',  @senales1_OutputFcn, ...
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


% --- Executes just before senales1 is made visible.
function senales1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to senales1 (see VARARGIN)

% Choose default command line output for senales1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes senales1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = senales1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on selection change in senal1.
function senal1_Callback(hObject, eventdata, handles)
% hObject    handle to senal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns senal1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from senal1
% --- Executes during object creation, after setting all properties.
v=get(handles.senal1. 'Value');
set(handles.s_2.'String'. v);
switch v
   case 1
   case 2
   case 3
   case 4
   case 5
   case 6
   otherwise
end     
function senal1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to senal1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in senal2.
function senal2_Callback(hObject, eventdata, handles)
% hObject    handle to senal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns senal2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from senal2


% --- Executes during object creation, after setting all properties.
w=get(handles.senal1. 'Value');
set(handles.s_2.'String'. w);
switch w
   case 1
   case 2
   case 3
   case 4
   case 5
   case 6
   otherwise
end  

function senal2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to senal2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in resultado.
function resultado_Callback(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns resultado contents as cell array
%        contents{get(hObject,'Value')} returns selected item from resultado


% --- Executes during object creation, after setting all properties.
z=get(handles.senal1. 'Value');
set(handles.s_2.'String'. z);
switch z
   case 1
   case 2
   case 3
   case 4
   case 5
   otherwise
end  
function resultado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
