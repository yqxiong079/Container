function [I]=BJxc(bw)%±³¾°Ïû³ý
SE=strel('square',6);
% SE=strel('disk',8);
% SE=strel('line',8,0);
I1=imopen(bw,SE);
% figure,imshow(I1);
I=imsubtract(bw,I1);
