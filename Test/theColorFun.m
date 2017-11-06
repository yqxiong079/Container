function [ direction, output_line,tempLeft,tempRight ] = theColorFun( input_img )
I{10} = '0';
I{1} = input_img;
% I{1} = imread('resource/2/3.jpg');
[m,n]=size(I{1});%获得图像的行列
n = n/3;
direction = 0;
output_line = 0;

%% 黑色箱号
I{2} = I{1};
I{2} = imadjust(I{2}, [0.5 0.7], []);
for tarx=1:m
    for tary=1:n
        if(I{2}(tarx,tary,1)<50&&I{2}(tarx,tary,2)<50&&I{2}(tarx,tary,3)<50)
            I{2}(tarx,tary,:) = 255;
        else
            I{2}(tarx,tary,:) = 0;
        end

    end
end
% figure;imshow(I{2});
I{2} = testDuibidu(I{2});
[ direction,output_line,tempLeft,tempRight ] = theBasicFun(I{2});
%% 白色箱号
if(direction==0)
    I{3} = I{1};
    I{3} = imadjust(I{3}, [0.5 0.7], []);
    for tarx=1:m
        for tary=1:n
            if(I{3}(tarx,tary,1)>100&&I{3}(tarx,tary,2)>100&&I{3}(tarx,tary,3)>100)
                I{3}(tarx,tary,:) = 255;
            else
                I{3}(tarx,tary,:) = 0;
            end

        end
    end
    I{3} = testDuibidu(I{3});
    [ direction,output_line,tempLeft,tempRight ] = theBasicFun(I{3});
else
end
end

