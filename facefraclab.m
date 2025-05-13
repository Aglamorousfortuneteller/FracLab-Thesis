function varargout = facefraclab(varargin)
%FACEFRACLAB MATLAB code file for facefraclab.fig
%      FACEFRACLAB, by itself, creates a new FACEFRACLAB or raises the existing
%      singleton*.
%
%      H = FACEFRACLAB returns the handle to a new FACEFRACLAB or the handle to
%      the existing singleton*.
%
%      FACEFRACLAB('Property','Value',...) creates a new FACEFRACLAB using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to facefraclab_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      FACEFRACLAB('CALLBACK') and FACEFRACLAB('CALLBACK',hObject,...) call the
%      local function named CALLBACK in FACEFRACLAB.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help facefraclab

% Last Modified by GUIDE v2.5 14-May-2019 00:18:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @facefraclab_OpeningFcn, ...
                   'gui_OutputFcn',  @facefraclab_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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
% --- Executes just before facefraclab is made visible.
function facefraclab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for facefraclab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imshow('BR.png')

% UIWAIT makes facefraclab wait for user response (see UIRESUME)
% uiwait(handles.figure1);
% --- Outputs from this function are returned to the command line.
function varargout = facefraclab_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
imshow('BR.png')

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(~, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes1
imshow('BR.png')

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run fraclab.m


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes2
imshow('BR.png')
