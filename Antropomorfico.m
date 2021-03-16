function varargout = Antropomorfico(varargin)
% ANTROPOMORFICO MATLAB code for Antropomorfico.fig
%      ANTROPOMORFICO, by itself, creates a new ANTROPOMORFICO or raises the existing
%      singleton*.
%
%      H = ANTROPOMORFICO returns the handle to a new ANTROPOMORFICO or the handle to
%      the existing singleton*.
%
%      ANTROPOMORFICO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANTROPOMORFICO.M with the given input arguments.
%
%      ANTROPOMORFICO('Property','Value',...) creates a new ANTROPOMORFICO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Antropomorfico_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Antropomorfico_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Antropomorfico

% Last Modified by GUIDE v2.5 22-Oct-2018 11:20:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Antropomorfico_OpeningFcn, ...
                   'gui_OutputFcn',  @Antropomorfico_OutputFcn, ...
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


% --- Executes just before Antropomorfico is made visible.
function Antropomorfico_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Antropomorfico (see VARARGIN)

% Choose default command line output for Antropomorfico
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Antropomorfico wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Antropomorfico_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function q1_Callback(hObject, eventdata, handles)
% hObject    handle to q1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q1 as text
%        str2double(get(hObject,'String')) returns contents of q1 as a double


% --- Executes during object creation, after setting all properties.
function q1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q2_Callback(hObject, eventdata, handles)
% hObject    handle to q2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q2 as text
%        str2double(get(hObject,'String')) returns contents of q2 as a double


% --- Executes during object creation, after setting all properties.
function q2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function q3_Callback(hObject, eventdata, handles)
% hObject    handle to q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of q3 as text
%        str2double(get(hObject,'String')) returns contents of q3 as a double


% --- Executes during object creation, after setting all properties.
function q3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to q3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FKButton.
function FKButton_Callback(hObject, eventdata, handles)
% hObject    handle to FKButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

roundn = @(x,n) round(x*10^n)./10^n;

q1_rad          = str2double(get(handles.q1, 'String'))*pi/180;
q2_rad          = str2double(get(handles.q2, 'String'))*pi/180;
q3_rad          = str2double(get(handles.q3, 'String'))*pi/180;

d1_mm           = str2double(get(handles.d1, 'String'));
a2_mm           = str2double(get(handles.a2, 'String'));
a3_mm           = str2double(get(handles.a3, 'String'));

d1_m            = d1_mm/1000;
a2_m            = a2_mm/1000;
a3_m            = a3_mm/1000;

L(1)            = Link('d', d1_mm, 'a', 0, 'alpha', pi/2, 'standard', 'qlim', [0, +2*pi]);
L(2)            = Link('d', 0, 'a', a2_mm, 'alpha', 0, 'standard', 'qlim', [0, +2*pi]);
L(3)            = Link('d', 0, 'a', a3_mm, 'alpha', 0, 'standard', 'qlim', [0, +2*pi]);

Robot           = SerialLink(L);
Robot.name      = 'Amigo RRR';
Robot.plot([q1_rad q2_rad q3_rad], 'workspace', [-300 300 -300 300 0 300]);

[Px_m, Py_m, Pz_m, A, T] = ForwardKinematics(q1_rad, q2_rad, q3_rad, d1_m, a2_m, a3_m);
T               = roundn(T, 6);

Px_mm           = Px_m*1000;
Py_mm           = Py_m*1000;
Pz_mm           = Pz_m*1000;

set(handles.Px, 'String', num2str(Px_mm));
set(handles.Py, 'String', num2str(Py_mm));
set(handles.Pz, 'String', num2str(Pz_mm));

set(handles.MTH, 'Data', [T(1, 1) T(1, 2) T(1, 3) T(1, 4)*1000;...
    T(2, 1) T(2, 2) T(2, 3) T(2, 4)*1000; T(3, 1) T(3, 2) T(3, 3) T(3, 4)*1000;...
    0 0 0 1]);

handles.A = A;
guidata(hObject, handles);

function Px_Callback(hObject, eventdata, handles)
% hObject    handle to Px (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Px as text
%        str2double(get(hObject,'String')) returns contents of Px as a double


% --- Executes during object creation, after setting all properties.
function Px_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Px (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Py_Callback(hObject, eventdata, handles)
% hObject    handle to Py (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Py as text
%        str2double(get(hObject,'String')) returns contents of Py as a double


% --- Executes during object creation, after setting all properties.
function Py_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Py (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Pz_Callback(hObject, eventdata, handles)
% hObject    handle to Pz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Pz as text
%        str2double(get(hObject,'String')) returns contents of Pz as a double


% --- Executes during object creation, after setting all properties.
function Pz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Pz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in IKButton.
function IKButton_Callback(hObject, eventdata, handles)
% hObject    handle to IKButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

roundn = @(x,n) round(x*10^n)./10^n;

Px_m            = str2double(get(handles.Px, 'String'))/1000;
Py_m            = str2double(get(handles.Py, 'String'))/1000;
Pz_m            = str2double(get(handles.Pz, 'String'))/1000;

d1_mm           = str2double(get(handles.d1, 'String'));
a2_mm           = str2double(get(handles.a2, 'String'));
a3_mm           = str2double(get(handles.a3, 'String'));

d1_m            = d1_mm/1000;
a2_m            = a2_mm/1000;
a3_m            = a3_mm/1000;

L(1) = Link('d', d1_mm, 'a', 0, 'alpha', pi/2, 'standard', 'qlim', [0, +2*pi]);
L(2) = Link('d', 0, 'a', a2_mm, 'alpha', 0, 'standard', 'qlim', [0, +2*pi]);
L(3) = Link('d', 0, 'a', a3_mm, 'alpha', 0, 'standard', 'qlim', [0, +2*pi]);

Robot           = SerialLink(L);
Robot.name      = 'Amigo RRR';

[q1_rad, q2_rad, q3_rad, A, T] = InverseKinematics(Px_m, Py_m, Pz_m, d1_m, a2_m, a3_m);
T               = roundn(T, 6);

q1_grad         = q1_rad*(180/pi);
q2_grad         = q2_rad*(180/pi);
q3_grad         = q3_rad*(180/pi);

set(handles.q1, 'String', q1_grad);
set(handles.q2, 'String', q2_grad);
set(handles.q3, 'String', q3_grad);

Robot.plot([q1_rad q2_rad q3_rad], 'workspace', [-300 300 -300 300 0 300]);

set(handles.MTH, 'Data', [T(1, 1) T(1, 2) T(1, 3) T(1, 4)*1000;...
    T(2, 1) T(2, 2) T(2, 3) T(2, 4)*1000; T(3, 1) T(3, 2) T(3, 3) T(3, 4)*1000;...
    0 0 0 1]);

handles.A = A;
guidata(hObject, handles);

function w1_Callback(hObject, eventdata, handles)
% hObject    handle to w1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w1 as text
%        str2double(get(hObject,'String')) returns contents of w1 as a double


% --- Executes during object creation, after setting all properties.
function w1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w2_Callback(hObject, eventdata, handles)
% hObject    handle to w2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w2 as text
%        str2double(get(hObject,'String')) returns contents of w2 as a double


% --- Executes during object creation, after setting all properties.
function w2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w3_Callback(hObject, eventdata, handles)
% hObject    handle to w3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w3 as text
%        str2double(get(hObject,'String')) returns contents of w3 as a double


% --- Executes during object creation, after setting all properties.
function w3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FJButton.
function FJButton_Callback(hObject, eventdata, handles)
% hObject    handle to FJButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

q1_rad          = str2double(get(handles.q1, 'String'))*pi/180;
q2_rad          = str2double(get(handles.q2, 'String'))*pi/180;
q3_rad          = str2double(get(handles.q3, 'String'))*pi/180;

w1_rads         = str2double(get(handles.w1, 'String'))*pi/180;
w2_rads         = str2double(get(handles.w2, 'String'))*pi/180;
w3_rads         = str2double(get(handles.w3, 'String'))*pi/180;

alpha1_rads2    = str2double(get(handles.alpha1, 'String'))*pi/180;
alpha2_rads2    = str2double(get(handles.alpha2, 'String'))*pi/180;
alpha3_rads2    = str2double(get(handles.alpha3, 'String'))*pi/180;

d1_mm           = str2double(get(handles.d1, 'String'));
a2_mm           = str2double(get(handles.a2, 'String'));
a3_mm           = str2double(get(handles.a3, 'String'));

d1_m            = d1_mm/1000;
a2_m            = a2_mm/1000;
a3_m            = a3_mm/1000;

[Vx_ms, Vy_ms, Vz_ms, Ax_ms2, Ay_ms2, Az_ms2]    = ForwardJacobian(q1_rad,...
    q2_rad, q3_rad, w1_rads, w2_rads, w3_rads, alpha1_rads2, alpha2_rads2,...
    alpha3_rads2, d1_m, a2_m, a3_m);

Vx_mms          = Vx_ms*1000;
Vy_mms          = Vy_ms*1000;
Vz_mms          = Vz_ms*1000;

Ax_mms2         = Ax_ms2*1000;
Ay_mms2         = Ay_ms2*1000;
Az_mms2         = Az_ms2*1000;

set(handles.Vx, 'String', Vx_mms);
set(handles.Vy, 'String', Vy_mms);
set(handles.Vz, 'String', Vz_mms);

set(handles.Ax, 'String', Ax_mms2);
set(handles.Ay, 'String', Ay_mms2);
set(handles.Az, 'String', Az_mms2);

function Vx_Callback(hObject, eventdata, handles)
% hObject    handle to Vx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vx as text
%        str2double(get(hObject,'String')) returns contents of Vx as a double


% --- Executes during object creation, after setting all properties.
function Vx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vy_Callback(hObject, eventdata, handles)
% hObject    handle to Vy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vy as text
%        str2double(get(hObject,'String')) returns contents of Vy as a double


% --- Executes during object creation, after setting all properties.
function Vy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vz_Callback(hObject, eventdata, handles)
% hObject    handle to Vz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vz as text
%        str2double(get(hObject,'String')) returns contents of Vz as a double


% --- Executes during object creation, after setting all properties.
function Vz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in IJButton.
function IJButton_Callback(hObject, eventdata, handles)
% hObject    handle to IJButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

Px_m            = str2double(get(handles.Px, 'String'))/1000;
Py_m            = str2double(get(handles.Py, 'String'))/1000;
Pz_m            = str2double(get(handles.Pz, 'String'))/1000;

Vx_ms           = str2double(get(handles.Vx, 'String'))/1000;
Vy_ms           = str2double(get(handles.Vy, 'String'))/1000;
Vz_ms           = str2double(get(handles.Vz, 'String'))/1000;

Ax_ms2          = str2double(get(handles.Ax, 'String'))/1000;
Ay_ms2          = str2double(get(handles.Ay, 'String'))/1000;
Az_ms2          = str2double(get(handles.Az, 'String'))/1000;

d1_mm           = str2double(get(handles.d1, 'String'));
a2_mm           = str2double(get(handles.a2, 'String'));
a3_mm           = str2double(get(handles.a3, 'String'));

d1_m            = d1_mm/1000;
a2_m            = a2_mm/1000;
a3_m            = a3_mm/1000;

[w1_rads, w2_rads, w3_rads, alpha1_rads2, alpha2_rads2, alpha3_rads2] = InverseJacobian(Px_m,...
    Py_m, Pz_m, Vx_ms, Vy_ms, Vz_ms, Ax_ms2, Ay_ms2, Az_ms2, d1_m, a2_m, a3_m);

w1_grads        = w1_rads*(180/pi);
w2_grads        = w2_rads*(180/pi);
w3_grads        = w3_rads*(180/pi);

alpha1_grads2   = alpha1_rads2*(180/pi);
alpha2_grads2   = alpha2_rads2*(180/pi);
alpha3_grads2   = alpha3_rads2*(180/pi);

set(handles.w1, 'String', w1_grads);
set(handles.w2, 'String', w2_grads);
set(handles.w3, 'String', w3_grads);

set(handles.alpha1, 'String', alpha1_grads2);
set(handles.alpha2, 'String', alpha2_grads2);
set(handles.alpha3, 'String', alpha3_grads2);

function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha1_Callback(hObject, eventdata, handles)
% hObject    handle to alpha1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha1 as text
%        str2double(get(hObject,'String')) returns contents of alpha1 as a double


% --- Executes during object creation, after setting all properties.
function alpha1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha2_Callback(hObject, eventdata, handles)
% hObject    handle to alpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha2 as text
%        str2double(get(hObject,'String')) returns contents of alpha2 as a double


% --- Executes during object creation, after setting all properties.
function alpha2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha3_Callback(hObject, eventdata, handles)
% hObject    handle to alpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha3 as text
%        str2double(get(hObject,'String')) returns contents of alpha3 as a double


% --- Executes during object creation, after setting all properties.
function alpha3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ax_Callback(hObject, eventdata, handles)
% hObject    handle to Ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ax as text
%        str2double(get(hObject,'String')) returns contents of Ax as a double


% --- Executes during object creation, after setting all properties.
function Ax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ay_Callback(hObject, eventdata, handles)
% hObject    handle to Ay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ay as text
%        str2double(get(hObject,'String')) returns contents of Ay as a double


% --- Executes during object creation, after setting all properties.
function Ay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Az_Callback(hObject, eventdata, handles)
% hObject    handle to Az (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Az as text
%        str2double(get(hObject,'String')) returns contents of Az as a double


% --- Executes during object creation, after setting all properties.
function Az_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Az (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d1_Callback(hObject, eventdata, handles)
% hObject    handle to d1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d1 as text
%        str2double(get(hObject,'String')) returns contents of d1 as a double


% --- Executes during object creation, after setting all properties.
function d1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a2_Callback(hObject, eventdata, handles)
% hObject    handle to a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a2 as text
%        str2double(get(hObject,'String')) returns contents of a2 as a double


% --- Executes during object creation, after setting all properties.
function a2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a3_Callback(hObject, eventdata, handles)
% hObject    handle to a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a3 as text
%        str2double(get(hObject,'String')) returns contents of a3 as a double


% --- Executes during object creation, after setting all properties.
function a3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function g_Callback(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of g as text
%        str2double(get(hObject,'String')) returns contents of g as a double


% --- Executes during object creation, after setting all properties.
function g_CreateFcn(hObject, eventdata, handles)
% hObject    handle to g (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m1_Callback(hObject, eventdata, handles)
% hObject    handle to m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m1 as text
%        str2double(get(hObject,'String')) returns contents of m1 as a double


% --- Executes during object creation, after setting all properties.
function m1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m2_Callback(hObject, eventdata, handles)
% hObject    handle to m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m2 as text
%        str2double(get(hObject,'String')) returns contents of m2 as a double


% --- Executes during object creation, after setting all properties.
function m2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m3_Callback(hObject, eventdata, handles)
% hObject    handle to m3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m3 as text
%        str2double(get(hObject,'String')) returns contents of m3 as a double


% --- Executes during object creation, after setting all properties.
function m3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m4_Callback(hObject, eventdata, handles)
% hObject    handle to m4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m4 as text
%        str2double(get(hObject,'String')) returns contents of m4 as a double


% --- Executes during object creation, after setting all properties.
function m4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y1_Callback(hObject, eventdata, handles)
% hObject    handle to y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y1 as text
%        str2double(get(hObject,'String')) returns contents of y1 as a double


% --- Executes during object creation, after setting all properties.
function y1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z1_Callback(hObject, eventdata, handles)
% hObject    handle to z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z1 as text
%        str2double(get(hObject,'String')) returns contents of z1 as a double


% --- Executes during object creation, after setting all properties.
function z1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1_Callback(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1 as text
%        str2double(get(hObject,'String')) returns contents of x1 as a double


% --- Executes during object creation, after setting all properties.
function x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2_Callback(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2 as text
%        str2double(get(hObject,'String')) returns contents of x2 as a double


% --- Executes during object creation, after setting all properties.
function x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z2_Callback(hObject, eventdata, handles)
% hObject    handle to z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z2 as text
%        str2double(get(hObject,'String')) returns contents of z2 as a double


% --- Executes during object creation, after setting all properties.
function z2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y2_Callback(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y2 as text
%        str2double(get(hObject,'String')) returns contents of y2 as a double


% --- Executes during object creation, after setting all properties.
function y2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x3_Callback(hObject, eventdata, handles)
% hObject    handle to x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x3 as text
%        str2double(get(hObject,'String')) returns contents of x3 as a double


% --- Executes during object creation, after setting all properties.
function x3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z3_Callback(hObject, eventdata, handles)
% hObject    handle to z3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z3 as text
%        str2double(get(hObject,'String')) returns contents of z3 as a double


% --- Executes during object creation, after setting all properties.
function z3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y3_Callback(hObject, eventdata, handles)
% hObject    handle to y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y3 as text
%        str2double(get(hObject,'String')) returns contents of y3 as a double


% --- Executes during object creation, after setting all properties.
function y3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in NEButton.
function NEButton_Callback(hObject, eventdata, handles)
% hObject    handle to NEButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

A = handles.A;

q1_rad          = str2double(get(handles.q1, 'String'))*pi/180;
q2_rad          = str2double(get(handles.q2, 'String'))*pi/180;
q3_rad          = str2double(get(handles.q3, 'String'))*pi/180;

w1_rads         = str2double(get(handles.w1, 'String'))*pi/180;
w2_rads         = str2double(get(handles.w2, 'String'))*pi/180;
w3_rads         = str2double(get(handles.w3, 'String'))*pi/180;

alpha1_rads2    = str2double(get(handles.alpha1, 'String'))*pi/180;
alpha2_rads2    = str2double(get(handles.alpha2, 'String'))*pi/180;
alpha3_rads2    = str2double(get(handles.alpha3, 'String'))*pi/180;

m1_kg           = str2double(get(handles.m1, 'String'))/1000;
m2_kg           = str2double(get(handles.m2, 'String'))/1000;
m3_kg           = str2double(get(handles.m3, 'String'))/1000;
m4_kg           = str2double(get(handles.m4, 'String'))/1000;

d1_m            = str2double(get(handles.d1, 'String'))/1000;
a2_m            = str2double(get(handles.a2, 'String'))/1000;
a3_m            = str2double(get(handles.a3, 'String'))/1000;

g_ms2           = str2double(get(handles.g, 'String'));

x1_m            = str2double(get(handles.x1, 'String'))/1000;
y1_m            = str2double(get(handles.y1, 'String'))/1000;
z1_m            = str2double(get(handles.z1, 'String'))/1000;

x2_m            = str2double(get(handles.x2, 'String'))/1000;
y2_m            = str2double(get(handles.y2, 'String'))/1000;
z2_m            = str2double(get(handles.z2, 'String'))/1000;

x3_m            = str2double(get(handles.x3, 'String'))/1000;
y3_m            = str2double(get(handles.y3, 'String'))/1000;
z3_m            = str2double(get(handles.z3, 'String'))/1000;

[T1_Nm, T2_Nm, T3_Nm] = InverseDynamics(A, q1_rad, q2_rad, q3_rad, w1_rads,...
    w2_rads, w3_rads, alpha1_rads2, alpha2_rads2, alpha3_rads2, m1_kg, m2_kg,...
    m3_kg, m4_kg, d1_m, a2_m, a3_m, g_ms2, x1_m, x2_m, x3_m, y1_m, y2_m, y3_m,...
    z1_m, z2_m, z3_m);

T1_kgFcm        = T1_Nm*10.19716212978;
T2_kgFcm        = T2_Nm*10.19716212978;
T3_kgFcm        = T3_Nm*10.19716212978;

set(handles.T1, 'String', T1_kgFcm);
set(handles.T2, 'String', T2_kgFcm);
set(handles.T3, 'String', T3_kgFcm);

function T1_Callback(hObject, eventdata, handles)
% hObject    handle to T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T1 as text
%        str2double(get(hObject,'String')) returns contents of T1 as a double


% --- Executes during object creation, after setting all properties.
function T1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function T2_Callback(hObject, eventdata, handles)
% hObject    handle to T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T2 as text
%        str2double(get(hObject,'String')) returns contents of T2 as a double


% --- Executes during object creation, after setting all properties.
function T2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function T3_Callback(hObject, eventdata, handles)
% hObject    handle to T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of T3 as text
%        str2double(get(hObject,'String')) returns contents of T3 as a double


% --- Executes during object creation, after setting all properties.
function T3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to T3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
