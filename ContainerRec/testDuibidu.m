%% 可调用的方法
function [ OutMe ] = testDuibidu( imgUrl )
I0 = imgUrl;
I1 = rgb2gray(I0);%灰度变换
% figure,imshow(I1);title('灰度图像', 'FontWeight', 'Bold');
I3=wiener2(I1,[3 3]);%维纳滤波
% figure,imshow(I3);
I4=BJxc(I3);
% figure,imshow(I4);title('背景消除后图像', 'FontWeight', 'Bold');
thresh=graythresh(I4);%Otsu二值化
I6=im2bw(I4,thresh);
% figure,imshow(I6);title('二值化后图像', 'FontWeight', 'Bold');
%     I0 = rgb2gray(I0);%灰度
%     K2 = imadjust(I0, [0.5 0.7], []);
%     K2 = ordfilt2(K2 ,5,ones(3,3));%滤波
%     level = graythresh(K2);
%     I1=im2bw(K2,level);%OTUS二值化
%     I1 =bwareaopen(I1,50);
% %     figure,imshow(I1);
% I7 =bwareaopen(I6,50);
% figure,imshow(I7);
OutMe = I6;
end