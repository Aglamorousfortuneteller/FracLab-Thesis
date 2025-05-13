clc;
 psh=0;
%uigetfiles initialization
[file, path] = uigetfile( ... 
{ '*.*', 'All Files (*.*)'; ...
'*.dcm','DICOM (*.dcm)'; ... 
'*.png','PNG (*.png)'}, ...
'Select file to process');
%uigetfiles initialization end
%recognition of extension
file=cellstr(file);
cext=char(extractAfter(file,"."));
sizeofimage=numel(cext);
figure
switch cext
case 'dcm'
Im= dicomread(horzcat(path,char(file))); 
            if ndims(Im)>3
               Imsqueezed=squeeze(Im);
               Imsqueezed1=Imsqueezed(:,:,1);
               Imsqueezed2=Imsqueezed(:,:,2);
               Imsqueezed3=Imsqueezed(:,:,3);
               Imcat=cat(3,Imsqueezed1,Imsqueezed2,Imsqueezed3);
               I{k}=rgb2gray(Imcat);
               imshow(I)
p=imcontrast
disp(clock);
waitfor(p);
disp(clock);
saveas(gcf,'buffimage.png')

I= Im;
else I=Im; 
            end
case {'jpg','png','tiff','gif','bmp'} 
Im= imread([path,char(file)]);
if ndims(Im)<=2
Im=Im;
else
Im(:,:,2:3)=[];
end
imshow(Im)
p=imcontrast
disp(clock);
waitfor(p);
disp(clock)
saveas(gcf,'buffimage.png')

I= Im;
    otherwise 
    I= load([path,char(file)]);
imshow(I)
p=imcontrast
disp(clock);
waitfor(p);
disp(clock)
saveas(gcf,'buffimage.png')
I= Im;
end %reading selected file end
[A,B]= size(I);
for z=2:7
nonlinfilter = @(x) floor(((max(x)-min(x))/z))+ 1;
Imfilt= colfilt(I, [z z],'sliding', nonlinfilter);
Z{z}= log(double(Imfilt * (49/(z^2))));
end
k=log(2:7);
Xslope=dot(k,k)-(sum(k)^2)/6;
for a = 1:A
 for b = 1:B
 fd= [Z{7}(a,b), Z{6}(a,b),...
     Z{5}(a,b), Z{4}(a,b), Z{3}(a,b), Z{2}(a,b)];
 Yslope=dot(k,fd)-(sum(k)*sum(fd))/6; 
FracDim(a,b)= (Yslope/Xslope); %mesh for image
end
end
delete buffimage.png
figure,[f, w, z]= roipoly(mat2gray(FracDim));
for i=1:size(I,2) 
ROI= FracDim(find(f==1));
close;
FrD= sum(ROI)/ numel(ROI);
if FrD>=1
H=2-FrD;
elseif FrD<1
    H=1-FrD;
end
Lac= ((sum(ROI.^2)/(length(ROI)))./((sum(ROI)/(length(ROI)))^2))-1;
end
FrD;
H;
Lac;
string1 ={['Fractal Dimention = ',num2str(FrD)],['Hurst index = ',num2str(H)],['Lacunarity = ',num2str(Lac)]};
results=figure('Renderer', 'painters', 'Position', [800 300 300 300]);
set(results, 'MenuBar', 'none');
set(results, 'ToolBar', 'none');
set(results,'name','Results','numbertitle','off')
set(results,'color',[1 .85 .9])
hA=axes;
set(hA,'color',[1 1 1],'visible','off')
text(0.25,0.5,['\it^{',string1,'}'],'FontSize',14)
clc;
w = waitforbuttonpress;
close all
rowoffset = 2+psh;
origdir=path;
cellrange1 = ['A',num2str(rowoffset),':','A',num2str(rowoffset)];
cellrange2 = ['B',num2str(rowoffset),':','B',num2str(rowoffset)];
cellrange3 = ['C',num2str(rowoffset),':','C',num2str(rowoffset)];
cellrange11 = ['A1:A1'];
cellrange22 = ['B1:B1'];
cellrange33 = ['C1:C1'];
cellrange44 = ['D1:D1'];
xlswrite([origdir,'results.xlsx'],FrD,'results',cellrange1);
xlswrite([origdir,'results.xlsx'],H,'results',cellrange2);
xlswrite([origdir,'results.xlsx'],Lac,'results',cellrange3);
xlswrite([origdir,'results.xlsx'],['Fractal dimention'],'results',cellrange11);
xlswrite([origdir,'results.xlsx'],['Hurst Index'],'results',cellrange22);
xlswrite([origdir,'results.xlsx'],['Lacunarity'],'results',cellrange33);
clc;