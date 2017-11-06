global h_axes1;
global h_axes2;
global h_axes3;
% global text1;
h_f=figure;set(gcf,'outerposition',get(0,'screensize'),'name', '集装箱箱号智能识别系统','menubar','none', 'numbertitle','off');
h_axes1 = axes('parent', h_f, 'position', [0.06 0.65 0.3 0.3],'visible', 'off');
h_axes2 = axes('parent', h_f, 'position', [0.6 0.65 0.3 0.3],'visible', 'off');
h_axes3 = axes('parent', h_f, 'position', [0.06 0.25 0.3 0.3],'visible', 'off');
h_btnOpenImage = uicontrol(h_f, 'style', 'push', 'string', '打开', 'unit', 'normalized',...
    'position', [0.15 0.56 0.1 0.05], 'callback', 'OpenImage');
h_btnCartonNumberSegmentation = uicontrol(h_f, 'style', 'push', 'string', '箱号提取', 'unit', 'normalized',...
    'position', [0.7 0.56 0.1 0.05], 'callback', 'CartonNumberExtraction( )');
h_btnCharacterSegmentation = uicontrol(h_f, 'style', 'push', 'string', '字符分割', 'unit', 'normalized',...
    'position', [0.15 0.15 0.1 0.05], 'callback', 'CharacterSegmentation( )');
h_btnCharacterRecognition = uicontrol(h_f, 'style', 'push', 'string', '字符识别', 'unit', 'normalized',...
    'position', [0.7 0.15 0.1 0.05], 'callback', 'CharacterRecognition( )');
% text1 = uicontrol(h_f, 'style', 'text','string', '','unit', 'normalized',...
%      'position', [0.6 0.25 0.3 0.03],'ForegroundColor','r','FontSize', 12,'visible', 'on','BackgroundColor','w');