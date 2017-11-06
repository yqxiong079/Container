clc;
clear all;
close all;
a=imread('fengedezifu\001.jpg');%读取一幅集装箱箱号区域图像
figure,imshow(a);
level = graythresh(a);
d=im2bw(a ,level);
figure,imshow(d);

% for i=0:1:10
%     I{6}=imrotate(d,i,'bilinear','loose');
%     figure,imshow(I{6});
% end

%     I{6}=d;
%     H=sum(I{6});
%     H1=sum(I{6}');
%       [m1,n1]=size(I{6});
%     for i1=1:n1
%         if H(1,i1)~=0
%             p1=i1;
%             break;
%         end
%     end
%     for j1=n1:-1:p1
%         if H(1,j1)~=0
%             f1=j1;
%             break;
%         end
%     end
%     for i2=1:m1
%         if H1(1,i2)~=0
%             p2=i2;
%             break;
%         end
%     end
%     for j2=m1:-1:p2
%         if H1(1,j2)~=0
%             f2=j2;
%             break;
%         end
%     end
%       I{6} = I{6}(p2:f2,p1:f1);
%       figure,imshow(I{6});
%       imwrite(I{6},'001.jpg','jpg');

%          I{6}=d;
%          I{6} = imresize(I{6},[36 20]);
%          figure,imshow(I{6});
%          imwrite(I{6},'001.jpg','jpg');

I{6}=d;
per = zeros(36,20,'uint8');
     Files = dir(strcat('fengedezifu\','*.jpg'));
        LengthFiles = length(Files);
        for i3 = 1:LengthFiles;
            Img = imread(strcat('fengedezifu\',Files(i3).name));
            if(mod(i3,20))
                 I{1}=[I{1} Img per]; 
                 if(i3==LengthFiles)
                     for j=1:(4-mod(i3,4))
                         I{1}=[I{1} per per];
                     end
                     I{2} = [I{2};I{1}];
                 end
            else
                I{1}=[I{1} Img per]; 
                if(size(I{2},1)<30)
                    I{2} = I{1};
                else
                    I{2} = [I{2};I{1}];
                end
                I{1} = zeros(0,0,'uint8');
            end
        end
      imwrite(I{2},'12.jpg','jpg');
      figure,imshow(I{2});
      
      

