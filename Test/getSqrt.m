function [ output_img ] = getSqrt( input_img )
%GETSQRT Summary of this function goes here
%   Detailed explanation goes here

I{10}  = '0';
I{1} = input_img;
% I{3} = imread('resource/16/3.jpg');
% figure;imshow(I{1});
% I{1} = rgb2gray(I{1});

% figure;imshow(I{1});
% I{1} = ordfilt2(I{1} ,5,ones(6,6));%滤波
% figure;imshow(I{1});

%% 下面是取色阶
hy = fspecial('sobel');
hx = hy';
Iy = imfilter(double(I{1}), hy, 'replicate');
Ix = imfilter(double(I{1}), hx, 'replicate');
gradmag = sqrt(Ix.^2 + Iy.^2);
%gradmagUint高阶
gradmagUint = im2uint8(gradmag/255);
[m,n] = size(gradmagUint);
%下面是对边界做一个消除
doWhrite = 20;
for i=1:m
    for j=1:n
        if(i<doWhrite||i>(m-doWhrite))
            gradmagUint(i,j,:) = 0;
            gradmag(i,j,:) = 0;
        end
        if(j<doWhrite||j>(n-doWhrite))
            gradmagUint(i,j,:) = 0;
            gradmag(i,j,:) = 0;
        end
        
    end
end
preGra = mean(gradmagUint(:));
disp(preGra);
for i=1:m
    for j=1:n
        if(gradmagUint(i,j,:)<2*preGra)
            gradmagUint(i,j,:) = 0;
            gradmag(i,j,:) = 0;
        end
    end
end

% figure('units', 'normalized', 'position', [0 0 1 1]);
% figure;
% subplot(1, 2, 1); imshow(I{3},[]), title('灰度增强图');
% subplot(1, 2, 2); imshow(gradmagUint,[]), title('梯度幅值图像');

% imwrite(gradmagUint,'grayImg.jpg')%保存图像为文件

output_img = gradmagUint;
initLevel = graythresh(gradmagUint);
gradmagUint=im2bw(gradmagUint,initLevel);
% figure;mesh(gradmag);
% figure;imshow(gradmagUint);
end

