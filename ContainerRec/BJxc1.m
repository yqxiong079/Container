function [I]=BJxc1(bw)%±³¾°Ïû³ý
SE=strel('square',7);
I1=imopen(bw,SE);
% figure,imshow(I1);
I=imsubtract(bw,I1);
