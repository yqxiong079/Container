clear all;
close all;
clc;
img_origin = imread('1.jpg');  
figure,imshow(img_origin);
Rimg=img_origin(:,:,1);
figure,imshow(Rimg);
Gimg=img_origin(:,:,2);
figure,imshow(Gimg);
Bimg=img_origin(:,:,3);
figure,imshow(Bimg);
  
k1 = -0.00000085;   % 形变参数，根据实际情况调整  
k2 = -0.00000225;  
  
img_size = size( Rimg );  
Rimg_undist = zeros( img_size );
Gimg_undist = zeros( img_size );
Bimg_undist = zeros( img_size );
Rimg_undist = uint8( Rimg_undist ); 
Gimg_undist = uint8( Gimg_undist ); 
Bimg_undist = uint8( Bimg_undist ); 
  
  
for i1 = 1:img_size(1)  % 垂直方向  
      
    y = i1 - img_size(1)/2;  
      
    for i2 = 1:img_size(2)  % 水平方向  
          
        x = i2 - img_size(2)/2;  
          
        x1 = round( x * ( 1 +k1 *x * x +k2 *y * y) );  
        y1 = round( y * ( 1 + k1 * x * x +k2 *y * y) );  
        y2 = y1 + img_size(1)/2;  
        x2 = x1 + img_size(2)/2;  
          
        Rimg_undist(i1,i2) = Rimg(round(y2), round(x2)); 
        Gimg_undist(i1,i2) = Gimg(round(y2), round(x2));
        Bimg_undist(i1,i2) = Bimg(round(y2), round(x2));
          
    end  
end 
figure;imshow(Rimg_undist);
figure;imshow(Gimg_undist);
figure;imshow(Bimg_undist);
img_undist(:,:,1)=Rimg_undist;
img_undist(:,:,2)=Gimg_undist;
img_undist(:,:,3)=Bimg_undist;
 
figure;imshow(img_undist);
imwrite(img_undist,'bxjz.jpg','jpg');

I0 = imread('bxjz.jpg');
I1 = rgb2gray(I0);%灰度变换
figure,imshow(I1);title('灰度图像', 'FontWeight', 'Bold');
I3=wiener2(I1,[3 3]);%维纳滤波
figure,imshow(I3);
I4=BJxc(I3);
figure,imshow(I4);title('背景消除后图像', 'FontWeight', 'Bold');
thresh=graythresh(I4);%Otsu二值化
f=im2bw(I4,thresh);
figure,imshow(f);title('二值化后图像', 'FontWeight', 'Bold');

% clc,close  
% BW=imread('D:\picture\9dafa605d53eea243812bb29.jpg');
%   
% BW=rgb2gray(BW);  
thresh=[0.01,0.17];  
sigma=2;%定义高斯参数  
% f = edge(double(BW),'canny',thresh,sigma);  
% figure(1),imshow(f,[]);  
% title('canny 边缘检测');  
  
[H, theta, rho]= hough(f,'RhoResolution', 5);  
%imshow(theta,rho,H,[],'notruesize'),axis on,axis normal  
%xlabel('\theta'),ylabel('rho');  
  
peak=houghpeaks(H,1);  
hold on  
  
lines=houghlines(f,theta,rho,peak);  
figure,imshow(f,[]),title('Hough Transform Detect Result'),hold on  
for k=1:length(lines)  
    xy=[lines(k).point1;lines(k).point2];  
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','r');  
end  
for i=1:2:3
    if i==1
    else 
    I6=imrotate(f,i,'bilinear','crop');
    figure,imshow(I6);
    end
end
