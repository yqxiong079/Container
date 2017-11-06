global filepath;
[filename, pathname] = uigetfile({'*.pgm;*.jpg;*tif', '(*.pgm), (*.jpg), (*.tif)'; ...
   '*.*', 'All Files(*.*)' }, '请选择一张要识别的集装箱图像');
if filename~=0
    filepath = [pathname,filename];
    axes(h_axes1),imshow(imread(filepath));
end