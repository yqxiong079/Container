clc;
clear;
close all;
a=imread('3.jpg');
figure,imshow(a);
level = graythresh(a);
d=im2bw(a ,level);
figure,imshow(d);

% f = zeros(50,2,'double');
%   tarf = 1;
%   [m,n] = size(d);
%   I{3} = d;
%   I{4} = I{3};
%   se = strel('line',20,90);
%   I{3} = imdilate(I{3},se);
%   figure,imshow(I{3});
%   
%     for tary=1:n
%     if(sum(I{3}(:,tary))>5)
%         if(f(tarf,1)==0)
%             f(tarf,1) = tary;
%         end
%     elseif(f(tarf,1)>0)
%         f(tarf,2) = tary;
%         tarf = tarf + 1;
%     end
% end
% Files = dir(strcat('fengedezifu\','*.jpg'));
% LengthFiles = length(Files);
% for i = 1:LengthFiles
%     delete(['fengedezifu\',Files(i).name]);
% end
% tara = 1;
%   for i=1:tarf-1
%       I{3}(:,f(i,1)) = 1;
%       I{3}(:,f(i,2)) = 1;
%       I{6} = I{4}(:,f(i,1):f(i,2));
%       imwrite(I{6},['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');   
%       tara = tara+1;
%   end

f = zeros(50,2,'double');
  tarf = 1;
  [m,~] = size(d);
  I{3} = d;
  I{4} = I{3};
  se = strel('line',10,0);
  I{3} = imdilate(I{3},se);
  figure,imshow(I{3});

  for tary=1:m
      if(sum(I{3}(tary,:))>5)
          if(f(tarf,1)==0)
              f(tarf,1) = tary;
          end
      elseif(f(tarf,1)>0)
          f(tarf,2) = tary;
          tarf = tarf + 1;
      end      
  end
  if(tarf<=11)
     f(tarf,2) = tary;
     tarf = tarf + 1;
  end
Files = dir(strcat('fengedezifu\','*.jpg'));
LengthFiles = length(Files);
for i = 1:LengthFiles
        delete(['fengedezifu\',Files(i).name]);
end
tara = 1;
  for i=1:tarf-1
      I{3}(f(i,1),:) = 1;
      I{3}(f(i,2),:) = 1;
      I{6} = I{4}(f(i,1):f(i,2),:);
      [m1,n1]=size(I{6});
      if m1>80
          I1 = I{6}(1:m1/2,:);
          I2 = I{6}(m1/2+1:m1,:);
      imwrite(I1,['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');
      tara = tara+1;
      imwrite(I2,['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');
      tara = tara+1;
      else
      imwrite(I{6},['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');
      tara = tara+1;
      end
  end