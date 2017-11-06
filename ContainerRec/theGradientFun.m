function [ direction, output_line, new_img,tempLeft,tempRight ] = theGradientFun( input_img, old_img )
I{10} = '0';
I{2} = imread('data/3.jpg');
R = I{2}(:,:,1);
G = I{2}(:,:,2);
B = I{2}(:,:,3);
%% 均值漂移
hr = 10;
hs = 5;
R = meanshiftsmooth(R,hr,hs);
G = meanshiftsmooth(G,hr,hs);
B = meanshiftsmooth(B,hr,hs);
B1 = imadjust(B, [0.2 0.9], []);
G1 = imadjust(G, [0.2 0.9], []);
R1 = imadjust(R, [0.2 0.9], []);
I{2} = cat(3,R1,G1,B1);
I{2} = rgb2gray(I{2});
I{1} = getNumFromBw(I{2});
stats = regionprops(I{1},'all');
statsLength = length(stats);
total = bwarea(I{1});
meanArea = total/statsLength;
I{3} = I{1};
I{3}(:,:) = 0;
[rows,columns] = size(I(3));
for i=1:statsLength
    x1 = stats(i).SubarrayIdx{1,1}(1,1);
    x2 = stats(i).SubarrayIdx{1,1}(1,end);
    y1 = stats(i).SubarrayIdx{1,2}(1,1);
    y2 = stats(i).SubarrayIdx{1,2}(1,end);
    getRegion = I{2}(x1:x2,y1:y2,:);
    getRegion = edge(getRegion,'canny');%做Canny的边缘检测
    I{3}(x1:x2,y1:y2) = getRegion;    
end
[ direction, output_line, new_img,tempLeft,tempRight ] = locateNum( I{3}, old_img );
end

