function [ output_img ] = getNumFromBw(input_img )
I{10} = '0';
I{10} = input_img;
I{1} = getSqrt(I{10});
[m,n] = size(I{10});
n = n/3;
initLevel = graythresh(I{1});
I{2}=im2bw(I{1},initLevel);
I{2} =bwareaopen(I{2},50);
I{2} = imfill(I{2},'holes');
I{2} = im2uint8(I{2});
se=strel('rectangle',[5,5]);
I{3} = imdilate(I{2},se);
initLevel = graythresh(I{3});
I{4}=im2bw(I{3},initLevel);
guile = I{4};
output_img = I{4};
for i=1:m
    for j=1:n
        if(I{4}(i,j)==1)
        else
            I{10}(i,j,:) = 0;
        end
    end
end
end

