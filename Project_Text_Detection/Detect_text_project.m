function varargout = Detect_text_project(varargin)
% DETECT_TEXT_PROJECT MATLAB code for Detect_text_project.fig
%      DETECT_TEXT_PROJECT, by itself, creates a new DETECT_TEXT_PROJECT or raises the existing
%      singleton*.
%
%      H = DETECT_TEXT_PROJECT returns the handle to a new DETECT_TEXT_PROJECT or the handle to
%      the existing singleton*.
%
%      DETECT_TEXT_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DETECT_TEXT_PROJECT.M with the given input arguments.
%
%      DETECT_TEXT_PROJECT('Property','Value',...) creates a new DETECT_TEXT_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Detect_text_project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Detect_text_project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Detect_text_project

% Last Modified by GUIDE v2.5 16-May-2015 23:57:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Detect_text_project_OpeningFcn, ...
                   'gui_OutputFcn',  @Detect_text_project_OutputFcn, ...
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

% --- Executes just before Detect_text_project is made visible.
function Detect_text_project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Detect_text_project (see VARARGIN)

% Choose default command line output for Detect_text_project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Detect_text_project wait for user response (see UIRESUME)
% uiwait(handles.gui);


% --- Outputs from this function are returned to the command line.
function varargout = Detect_text_project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function tutorial_Callback(hObject, eventdata, handles)
% hObject    handle to tutorial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url = 'https://googledrive.com/host/0B-Dw0d6hE5v6dkU3YkVTM2VlSVE';
web(url,'-browser');

% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myicon = imread('icon.jpg');
msgbox({'Group 8: Mini Project' ' ' '12520671 Nguyen Duc Phu' '12520714 Ly Ba Thanh' '12520811 Vu Tuan Anh' ' ' 'Version 1.0.0'},...
'About','custom',myicon);

% --------------------------------------------------------------------
function openfilemenu_Callback(hObject, eventdata, handles)
% hObject    handle to openfilemenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*','Choose Image');
a = strcat(pathname, filename);
imf = imfinfo(a); 

b = imread(a);
axes(handles.axes1);
imshow(b);

setappdata(0,'a',b);

set(handles.filename,'String',filename);
set(handles.format,'String',imf.FileSize);
set(handles.filesize,'String',imf.Format);
set(handles.colortype,'String',imf.ColorType);
set(handles.bitdepth,'String',imf.BitDepth);
set(handles.width,'String',imf.Width);
set(handles.height,'String',imf.Height);
set(handles.datetime,'String',imf.DateTime);

% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.gui);

% --------------------------------------------------------------------
function openimage_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to openimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.*','Choose Image');
a = strcat(pathname, filename);
imf = imfinfo(a); 

b = imread(a);
axes(handles.axes1);
imshow(b);

setappdata(0,'a',b);

set(handles.filename,'String',filename);
set(handles.format,'String',imf.FileSize);
set(handles.filesize,'String',imf.Format);
set(handles.colortype,'String',imf.ColorType);
set(handles.bitdepth,'String',imf.BitDepth);
set(handles.width,'String',imf.Width);
set(handles.height,'String',imf.Height);
set(handles.datetime,'String',imf.DateTime);

% --- Executes on button press in button.
function button_Callback(hObject, eventdata, handles)
% hObject    handle to button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image2 = getappdata(0,'a');
d = ocr(image2);
c = insertObjectAnnotation(image2,'rectangle', ... 
                            d.WordBoundingBoxes, ...
                            d.WordConfidences);
                       
axes(handles.axes1);
imshow(c);

str = d.Text;

txt =   uicontrol('Style', 'text',...
    'Position',[580 160 180 300],...
    'String', str,...
    'FontSize',10,'FontWeight','normal',...
    'BackgroundColor', [.871 .922 .98]);

setappdata(0,'str',str);
setappdata(0,'txt', txt);

%set(findobj('Tag','text22'),'aaaaaaaaaasdadadaddsadas');
%-----------------------------


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
a = getappdata(0,'a');
content = get(hObject,'Value');

switch content
    case 1
        image2 = a;
        d = ocr(image2);
        c = insertObjectAnnotation(image2,'rectangle', ... 
                                    d.WordBoundingBoxes, ...
                                    d.WordConfidences);

        axes(handles.axes1);
        imshow(c);
    case 2
        colorImage = a;
        grayImage = rgb2gray(colorImage);
        mserRegions = detectMSERFeatures(grayImage,'RegionAreaRange',[150 2000]);
        mserRegionsPixels = vertcat(cell2mat(mserRegions.PixelList));  % extract regions

        % Visualize the MSER regions overlaid on the original image
        axes(handles.axes1);
        imshow(colorImage);
        hold on;
        plot(mserRegions, 'showPixelList', true,'showEllipses',false);
    
    case 3     
        
        colorImage = a;
        grayImage = rgb2gray(colorImage);
        mserRegions = detectMSERFeatures(grayImage,'RegionAreaRange',[150 2000]);
        mserRegionsPixels = vertcat(cell2mat(mserRegions.PixelList));  % extract regions
        
        %-----------
        mserMask = false(size(grayImage));
        ind = sub2ind(size(mserMask), mserRegionsPixels(:,2), mserRegionsPixels(:,1));
        mserMask(ind) = true;

        % Run the edge detector
        edgeMask = edge(grayImage, 'Canny');

        % Find intersection between edges and MSER regions
        edgeAndMSERIntersection = edgeMask & mserMask;
        axes(handles.axes1);
        imshowpair(edgeMask, edgeAndMSERIntersection, 'montage');
    
    case 4
        colorImage = a;
        grayImage = rgb2gray(colorImage);
        mserRegions = detectMSERFeatures(grayImage,'RegionAreaRange',[150 2000]);
        mserRegionsPixels = vertcat(cell2mat(mserRegions.PixelList));  % extract regions

        %-----------
        mserMask = false(size(grayImage));
        ind = sub2ind(size(mserMask), mserRegionsPixels(:,2), mserRegionsPixels(:,1));
        mserMask(ind) = true;

        % Run the edge detector
        edgeMask = edge(grayImage, 'Canny');

        % Find intersection between edges and MSER regions
        edgeAndMSERIntersection = edgeMask & mserMask;

        %imshowpair(edgeMask, edgeAndMSERIntersection, 'montage');

        %-----
        [~, gDir] = imgradient(grayImage);
        % You must specify if the text is light on dark background or vice versa
        gradientGrownEdgesMask = helperGrowEdges(edgeAndMSERIntersection, gDir, 'LightTextOnDark');
        axes(handles.axes1);
        imshow(gradientGrownEdgesMask);  
        
    case 5
        colorImage = a;
        grayImage = rgb2gray(colorImage);
        mserRegions = detectMSERFeatures(grayImage,'RegionAreaRange',[150 2000]);
        mserRegionsPixels = vertcat(cell2mat(mserRegions.PixelList));  % extract regions
        %-----------
        mserMask = false(size(grayImage));
        ind = sub2ind(size(mserMask), mserRegionsPixels(:,2), mserRegionsPixels(:,1));
        mserMask(ind) = true;

        % Run the edge detector
        edgeMask = edge(grayImage, 'Canny');

        % Find intersection between edges and MSER regions
        edgeAndMSERIntersection = edgeMask & mserMask;

        %imshowpair(edgeMask, edgeAndMSERIntersection, 'montage');

        %-----
        [~, gDir] = imgradient(grayImage);
        % You must specify if the text is light on dark background or vice versa
        gradientGrownEdgesMask = helperGrowEdges(edgeAndMSERIntersection, gDir, 'LightTextOnDark');

        %------
        % Remove gradient grown edge pixels
        edgeEnhancedMSERMask = ~gradientGrownEdgesMask & mserMask;

        % Visualize the effect of segmentation
        axes(handles.axes1);
        imshowpair(mserMask, edgeEnhancedMSERMask, 'montage');
        
    case 6
        colorImage = a;
        grayImage = rgb2gray(colorImage);
        mserRegions = detectMSERFeatures(grayImage,'RegionAreaRange',[150 2000]);
        mserRegionsPixels = vertcat(cell2mat(mserRegions.PixelList));  % extract regions
        %-----------
        mserMask = false(size(grayImage));
        ind = sub2ind(size(mserMask), mserRegionsPixels(:,2), mserRegionsPixels(:,1));
        mserMask(ind) = true;

        % Run the edge detector
        edgeMask = edge(grayImage, 'Canny');

        % Find intersection between edges and MSER regions
        edgeAndMSERIntersection = edgeMask & mserMask;

        %imshowpair(edgeMask, edgeAndMSERIntersection, 'montage');

        %-----
        [~, gDir] = imgradient(grayImage);
        % You must specify if the text is light on dark background or vice versa
        gradientGrownEdgesMask = helperGrowEdges(edgeAndMSERIntersection, gDir, 'LightTextOnDark');

        %------
        % Remove gradient grown edge pixels
        edgeEnhancedMSERMask = ~gradientGrownEdgesMask & mserMask;

        % Visualize the effect of segmentation

        %-----
        connComp = bwconncomp(edgeEnhancedMSERMask); % Find connected components
        stats = regionprops(connComp,'Area','Eccentricity','Solidity');

        % Eliminate regions that do not follow common text measurements
        regionFilteredTextMask = edgeEnhancedMSERMask;

        regionFilteredTextMask(vertcat(connComp.PixelIdxList{[stats.Eccentricity] > .995})) = 0;
        regionFilteredTextMask(vertcat(connComp.PixelIdxList{[stats.Area] < 150 | [stats.Area] > 2000})) = 0;
        regionFilteredTextMask(vertcat(connComp.PixelIdxList{[stats.Solidity] < .4})) = 0;

        % Visualize results of filtering
        axes(handles.axes1);
        imshowpair(edgeEnhancedMSERMask, regionFilteredTextMask, 'montage');       
    case 7
        colorImage = a;
        grayImage = rgb2gray(colorImage);
        mserRegions = detectMSERFeatures(grayImage,'RegionAreaRange',[150 2000]);
        mserRegionsPixels = vertcat(cell2mat(mserRegions.PixelList));  % extract regions
        %-----------
        mserMask = false(size(grayImage));
        ind = sub2ind(size(mserMask), mserRegionsPixels(:,2), mserRegionsPixels(:,1));
        mserMask(ind) = true;

        % Run the edge detector
        edgeMask = edge(grayImage, 'Canny');

        % Find intersection between edges and MSER regions
        edgeAndMSERIntersection = edgeMask & mserMask;

        %imshowpair(edgeMask, edgeAndMSERIntersection, 'montage');

        %-----
        [~, gDir] = imgradient(grayImage);
        % You must specify if the text is light on dark background or vice versa
        gradientGrownEdgesMask = helperGrowEdges(edgeAndMSERIntersection, gDir, 'LightTextOnDark');

        %------
        % Remove gradient grown edge pixels
        edgeEnhancedMSERMask = ~gradientGrownEdgesMask & mserMask;

        % Visualize the effect of segmentation

        %-----
        connComp = bwconncomp(edgeEnhancedMSERMask); % Find connected components
        stats = regionprops(connComp,'Area','Eccentricity','Solidity');

        % Eliminate regions that do not follow common text measurements
        regionFilteredTextMask = edgeEnhancedMSERMask;

        regionFilteredTextMask(vertcat(connComp.PixelIdxList{[stats.Eccentricity] > .995})) = 0;
        regionFilteredTextMask(vertcat(connComp.PixelIdxList{[stats.Area] < 150 | [stats.Area] > 2000})) = 0;
        regionFilteredTextMask(vertcat(connComp.PixelIdxList{[stats.Solidity] < .4})) = 0;

        % Visualize results of filtering

        %---
        distanceImage    = bwdist(~regionFilteredTextMask);  % Compute distance transform
        strokeWidthImage = helperStrokeWidth(distanceImage); % Compute stroke width image

        % Show stroke width image
        axes(handles.axes1);
        imshow(strokeWidthImage);
        caxis([0 max(max(strokeWidthImage))]); axis image, colormap('jet'), colorbar;
   
    case 8
        colorImage = a;
        grayImage = rgb2gray(colorImage);
        mserRegions = detectMSERFeatures(grayImage,'RegionAreaRange',[150 2000]);
        mserRegionsPixels = vertcat(cell2mat(mserRegions.PixelList));  % extract regions
        %-----------
        mserMask = false(size(grayImage));
        ind = sub2ind(size(mserMask), mserRegionsPixels(:,2), mserRegionsPixels(:,1));
        mserMask(ind) = true;

        % Run the edge detector
        edgeMask = edge(grayImage, 'Canny');

        % Find intersection between edges and MSER regions
        edgeAndMSERIntersection = edgeMask & mserMask;

        %imshowpair(edgeMask, edgeAndMSERIntersection, 'montage');

        %-----
        [~, gDir] = imgradient(grayImage);
        % You must specify if the text is light on dark background or vice versa
        gradientGrownEdgesMask = helperGrowEdges(edgeAndMSERIntersection, gDir, 'LightTextOnDark');

        %------
        % Remove gradient grown edge pixels
        edgeEnhancedMSERMask = ~gradientGrownEdgesMask & mserMask;

        % Visualize the effect of segmentation

        %-----
        connComp = bwconncomp(edgeEnhancedMSERMask); % Find connected components
        stats = regionprops(connComp,'Area','Eccentricity','Solidity');

        % Eliminate regions that do not follow common text measurements
        regionFilteredTextMask = edgeEnhancedMSERMask;

        regionFilteredTextMask(vertcat(connComp.PixelIdxList{[stats.Eccentricity] > .995})) = 0;
        regionFilteredTextMask(vertcat(connComp.PixelIdxList{[stats.Area] < 150 | [stats.Area] > 2000})) = 0;
        regionFilteredTextMask(vertcat(connComp.PixelIdxList{[stats.Solidity] < .4})) = 0;

        % Visualize results of filtering

        %---
        distanceImage    = bwdist(~regionFilteredTextMask);  % Compute distance transform
        strokeWidthImage = helperStrokeWidth(distanceImage); % Compute stroke width image

        %----
        % Find remaining connected components
        connComp = bwconncomp(regionFilteredTextMask);
        afterStrokeWidthTextMask = regionFilteredTextMask;
        for i = 1:connComp.NumObjects
            strokewidths = strokeWidthImage(connComp.PixelIdxList{i});
            % Compute normalized stroke width variation and compare to common value
            if std(strokewidths)/mean(strokewidths) > 0.35
                afterStrokeWidthTextMask(connComp.PixelIdxList{i}) = 0; % Remove from text candidates
            end
        end
        se1=strel('disk',25);
        se2=strel('disk',7);

        afterMorphologyMask = imclose(afterStrokeWidthTextMask,se1);
        afterMorphologyMask = imopen(afterMorphologyMask,se2);

        % Display image region corresponding to afterMorphologyMask
        displayImage = colorImage;
        displayImage(~repmat(afterMorphologyMask,1,1,3)) = 0;
        axes(handles.axes1);
        imshow(displayImage);
        
    otherwise               
        end



% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in openfiletext.
function openfiletext_Callback(hObject, eventdata, handles)
% hObject    handle to openfiletext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = getappdata(0,'str');
fid = fopen('text.txt','w');
fprintf(fid, '%s\n', str);
%fclose(fid);


% --------------------------------------------------------------------
function newimage_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to newimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
txt = getappdata(0,'txt');
cla;
delete(txt);
set(handles.filename,'String','');
set(handles.format,'String','');
set(handles.filesize,'String','');
set(handles.colortype,'String','');
set(handles.bitdepth,'String','');
set(handles.width,'String','');
set(handles.height,'String','');
set(handles.datetime,'String','');


% --------------------------------------------------------------------
function run_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image2 = getappdata(0,'a');
d = ocr(image2);
c = insertObjectAnnotation(image2,'rectangle', ... 
                            d.WordBoundingBoxes, ...
                            d.WordConfidences);
                       
axes(handles.axes1);
imshow(c);

str = d.Text;

txt =   uicontrol('Style', 'text',...
    'Position',[580 160 180 300],...
    'String', str,...
    'FontSize',10,'FontWeight','normal',...
    'BackgroundColor', [.871 .922 .98]);

setappdata(0,'str',str);
setappdata(0,'txt', txt);
