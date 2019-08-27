function varargout = people_id_gui_nw(varargin)
% PEOPLE_ID_GUI_NW MATLAB code for people_id_gui_nw.fig
%      PEOPLE_ID_GUI_NW, by itself, creates a new PEOPLE_ID_GUI_NW or raises the existing
%      singleton*.
%
%      H = PEOPLE_ID_GUI_NW returns the handle to a new PEOPLE_ID_GUI_NW or the handle to
%      the existing singleton*.
%
%      PEOPLE_ID_GUI_NW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PEOPLE_ID_GUI_NW.M with the given input arguments.
%
%      PEOPLE_ID_GUI_NW('Property','Value',...) creates a new PEOPLE_ID_GUI_NW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before people_id_gui_nw_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to people_id_gui_nw_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help people_id_gui_nw

% Last Modified by GUIDE v2.5 04-Oct-2016 17:36:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @people_id_gui_nw_OpeningFcn, ...
                   'gui_OutputFcn',  @people_id_gui_nw_OutputFcn, ...
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


% --- Executes just before people_id_gui_nw is made visible.
function people_id_gui_nw_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to people_id_gui_nw (see VARARGIN)

% Choose default command line output for people_id_gui_nw
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes people_id_gui_nw wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = people_id_gui_nw_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FN,PN]=uigetfile('*.*','select');
FileName=fullfile(PN,FN);
handles.file=FileName
handles.img=imread(FileName);
axes(handles.axes1)
imshow(handles.img);
 guidata(hObject, handles);
 
 

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


[F,mask]=start(handles.img);


midleye = F(1,:);
midreye = F(2,:);
mouth = F(3,:);
nose = F(4,:);
 


eyecntr = [(midreye(1)-midleye(1))/2 (midreye(2)-midleye(2))/2];


D1 = sqrt((midleye(1)-eyecntr(1)).^2 + (midleye(2)-eyecntr(2)).^2);

D2 = sqrt((midreye(1)-eyecntr(1)).^2 + (midreye(2)-eyecntr(2)).^2);

D3 = sqrt((midleye(1)-mouth(1)).^2 + (midleye(2)-mouth(2)).^2);

D4 = sqrt((midreye(1)-mouth(1)).^2 + (midreye(2)-mouth(2)).^2);

D5 = sqrt((midleye(1)-nose(1)).^2 + (midleye(2)-nose(2)).^2);

D6 = sqrt((midreye(1)-nose(1)).^2 + (midreye(2)-nose(2)).^2);

D7 = sqrt((mouth(1)-nose(1)).^2 + (mouth(2)-nose(2)).^2);



D3_cntr = [midleye(1)+(mouth(1)-midleye(1))/2 midleye(2)+(mouth(2)-midleye(2))/2];

D4_cntr = [mouth(1)+(midreye(1)-mouth(1))/2 midreye(2)+(mouth(2)-midreye(2))/2];

D5_cntr = [midleye(2)+(nose(1)-midleye(1))/2 midleye(2)+(nose(2)-midleye(2))/2];

D6_cntr = [nose(1)+(midreye(1)-nose(1))/2 midreye(2)+(nose(2)-midreye(2))/2];

if(nose(1)<mouth(1))
    D7_cntr = [nose(1)+(mouth(1)-nose(1))/2 nose(2)+(mouth(2)-nose(2))/2];
else
    D7_cntr = [mouth(1)+(nose(1)-mouth(1))/2 nose(2)+(mouth(2)-nose(2))/2];
end



M1 = sqrt((eyecntr(1)-D5_cntr(1)).^2 + (eyecntr(2)-D5_cntr(2)).^2);

M2 = sqrt((eyecntr(1)-D6_cntr(1)).^2 + (eyecntr(2)-D6_cntr(2)).^2);

M3 = sqrt((D3_cntr(1)-D7_cntr(1)).^2 + (D3_cntr(2)-D7_cntr(2)).^2);

M4 = sqrt((D4_cntr(1)-D7_cntr(1)).^2 + (D4_cntr(2)-D7_cntr(2)).^2);

M5 = sqrt((D3_cntr(1)-D5_cntr(1)).^2 + (D3_cntr(2)-D5_cntr(2)).^2);

M6 = sqrt((D4_cntr(1)-D6_cntr(1)).^2 + (D4_cntr(2)-D6_cntr(2)).^2);


F1 = (D1+D2)/D3;

F2 = (D1+D2)/D4;

F3 = (D1+D2)/D5;

F4 = (D1+D2)/D6;

F5 = (D1+D2)/D7;

F6 = D3/D4;

F7 = D5/D6;

F8 = D1/(M1+M3+M5);

F9 = D2/(M2+M4+M6);

F10 = M1/M2;

F11 = M3/M4;

F12 = M5/M6;

F13 = (M1+M3+M5)/(M2+M4+M6);

F14 = (M1+M2)/(M5+M6);

F15 = (M1+M2)/(M3+M4);

Ftest=[F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12 F13 F14 F15];

detcls = knn_1(Ftest);
%msgbox(strcat('Detected class is  ',num2str(detcls)));

switch (detcls)
    case 1 
        msgbox('Hai Kavin :)');
     case 2 
        msgbox('Hai Vikram :)')
     case 3
        msgbox('Hai Lolith :)')
     case 4
        msgbox('Hai Deepak :)')
     case 5
        msgbox('Hai Sundeep :)')
     case 6
        msgbox('Hai Pranav :)')
        
    otherwise
        warning('Unexpected plot type. No plot created.')
end

% switch (detcls)
%     case 1 
%         str1='Hai Sreedevi :)';
%      case 2 
%         str1='Hai Venugopal :)';
%      case 3
%         str1='Hai Subhadevi :)';
%      case 4
%         str1='Hai Pranav :)';
%     otherwise
%         warning('Unexpected plot type. No plot created.')
% end


axes(handles.axes2)
imshow(mask);




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% oldmsgs = cellstr(get(handles.edit1,'String'));
% set(handles.edit1,'String',[oldmsgs;{'Hai'}] );


%set(handles.edit1,'String',str1 );
