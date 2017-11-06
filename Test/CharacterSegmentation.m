function  [B]=CharacterSegmentation(cartonnum )
w= cartonnum;
% figure,imshow(w);
% imwrite(cartonnum,'dingwei.jpg','jpg');
a=rgb2gray(w);
% figure,imshow(a); 
b=imadjust(a);
% figure,imshow(b);
c= ordfilt2(b,5,ones(3,3));
% figure,imshow(c);
% level = graythresh(c);
% d=im2bw(c ,level);
% figure,imshow(d);
[height,width]=size(c);
% numVal_1 = sum(sum(d));
% numVal_0=length(find(d==0));
if(width/height>2)
level = graythresh(c);
d=im2bw(c ,level);
% figure,imshow(d);
numVal_1 = sum(sum(d));
numVal_0=length(find(d==0));
if(numVal_1<numVal_0)
    W=sum(d);
for j=1:width
    if W(1,j)>=0.88*height
        for k=1:height
            d(k,j)=0;
        end    
    end
end
% figure,imshow(d);
% d=~d;
%  figure,imshow(d);
g =bwareaopen(d,50);
% figure,imshow(g);
%  imwrite(g,'dingwei.jpg','jpg');
% g =e - bwareaopen(e,300);
% figure,imshow(g);
 
% w = cartonnum;
% a = rgb2gray(w);%灰度变换
% figure,imshow(a);title('灰度图像', 'FontWeight', 'Bold');
% b=wiener2(a,[3 3]);%维纳滤波
% figure,imshow(b);
% c=BJxc(b);
% figure,imshow(c);title('背景消除后图像', 'FontWeight', 'Bold');
% thresh=graythresh(c);%Otsu二值化
% d=im2bw(c,thresh);
% figure,imshow(d);
% g =bwareaopen(d,50);
% figure,imshow(g);
f = zeros(50,2,'double');
tarf = 1;
[~,n] = size(g);
I{3} = g;
I{4} = I{3};
se = strel('line',20,90);
I{3} = imdilate(I{3},se);
% figure,imshow(I{3});
for tary=1:n
    if(sum(I{3}(:,tary))>5)
        if(f(tarf,1)==0)
            f(tarf,1) = tary;
        end
    elseif(f(tarf,1)>0)
        f(tarf,2) = tary;
        tarf = tarf + 1;
    end
end
Files = dir(strcat('fengedezifu\','*.jpg'));
LengthFiles = length(Files);
for i = 1:LengthFiles
    delete(['fengedezifu\',Files(i).name]);
end
tara = 1;
  for i=1:tarf-1
      I{3}(:,f(i,1)) = 1;
      I{3}(:,f(i,2)) = 1;
      I{6} = I{4}(:,f(i,1):f(i,2));
       H=sum(I{6}');
      [m1,n1]=size(I{6});
    for i1=1:m1
        if H(1,i1)~=0
            p1=i1;
            break;
        end
    end
    for j1=m1:-1:p1
        if H(1,j1)~=0
            f1=j1;
            break;
        end
    end
      I{6} = I{6}(p1:f1,:);
      I{6} = imresize(I{6},[36 20]);
      imwrite(I{6},['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');   
      tara = tara+1;
  end
    per = zeros(36,20,'uint8');
     Files = dir(strcat('fengedezifu\','*.jpg'));
        LengthFiles = length(Files);
        for i = 1:LengthFiles;
            Img = imread(strcat('fengedezifu\',Files(i).name));
            if(mod(i,20))
                 I{1}=[I{1} Img per]; 
                 if(i==LengthFiles)
                     for j=1:(4-mod(i,4))
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
        B=I{2};
% figure,imshow(I{2});
else
    d=~d;
%     figure,imshow(d);
    W=sum(d);
for j=1:width
    if W(1,j)>=1.0*height
        for k=1:height
            d(k,j)=0;
        end    
    end
end
% figure,imshow(d);
g =bwareaopen(d,80);
% figure,imshow(g);
% g =e - bwareaopen(e,300);
% figure,imshow(g);
 
% w = cartonnum;
% a = rgb2gray(w);%灰度变换
% figure,imshow(a);title('灰度图像', 'FontWeight', 'Bold');
% b=wiener2(a,[3 3]);%维纳滤波
% figure,imshow(b);
% c=BJxc(b);
% figure,imshow(c);title('背景消除后图像', 'FontWeight', 'Bold');
% thresh=graythresh(c);%Otsu二值化
% d=im2bw(c,thresh);
% figure,imshow(d);
% g =bwareaopen(d,50);
% figure,imshow(g);
f = zeros(50,2,'double');
tarf = 1;
[~,n] = size(g);
I{3} = g;
I{4} = I{3};
se = strel('line',20,90);
I{3} = imdilate(I{3},se);
% figure,imshow(I{3});
for tary=1:n
    if(sum(I{3}(:,tary))>5)
        if(f(tarf,1)==0)
            f(tarf,1) = tary;
        end
    elseif(f(tarf,1)>0)
        f(tarf,2) = tary;
        tarf = tarf + 1;
    end
end
Files = dir(strcat('fengedezifu\','*.jpg'));
LengthFiles = length(Files);
for i = 1:LengthFiles
    delete(['fengedezifu\',Files(i).name]);
end
tara = 1;
  for i=1:tarf-1
      I{3}(:,f(i,1)) = 1;
      I{3}(:,f(i,2)) = 1;
      I{6} = I{4}(:,f(i,1):f(i,2));
      H=sum(I{6}');
      [m1,n1]=size(I{6});
    for i1=1:m1
        if H(1,i1)~=0
            p1=i1;
            break;
        end
    end
    for j1=m1:-1:p1
        if H(1,j1)~=0
            f1=j1;
            break;
        end
    end
      I{6} = I{6}(p1:f1,:);
      I{6} = imresize(I{6},[36 20]);
      imwrite(I{6},['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');   
      tara = tara+1;
  end
    per = zeros(36,20,'uint8');
     Files = dir(strcat('fengedezifu\','*.jpg'));
        LengthFiles = length(Files);
        for i = 1:LengthFiles;
            Img = imread(strcat('fengedezifu\',Files(i).name));
            if(mod(i,20))
                 I{1}=[I{1} Img per]; 
                 if(i==LengthFiles)
                     for j=1:(4-mod(i,4))
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
         B=I{2};
% figure,imshow(I{2});
end
elseif(width/height<1)
level = graythresh(c);
d=im2bw(c ,level);
% figure,imshow(d);
numVal_1 = sum(sum(d));
numVal_0=length(find(d==0));
if(numVal_1<numVal_0)
% g =bwareaopen(g,5);
%     figure,imshow(g1);
f = zeros(50,2,'double');
  tarf = 1;
  [m,~] = size(d);
  I{3} = d;
  I{4} = I{3};
  se = strel('line',20,0);
  I{3} = imdilate(I{3},se);
%   figure,imshow(I{3});
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
      H=sum(I{6});
      [m1,n1]=size(I{6});
    for i1=1:n1
        if H(1,i1)~=0
            p1=i1;
            break;
        end
    end
    for j1=n1:-1:p1
        if H(1,j1)~=0
            f1=j1;
            break;
        end
    end
      I{6} = I{6}(:,p1:f1);
      I{6} = imresize(I{6},[36 20]);
      imwrite(I{6},['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');
      tara = tara+1;
  end
  per = zeros(36,20,'uint8');
  Files = dir(strcat('fengedezifu\','*.jpg'));
        LengthFiles = length(Files);
        for i = 1:LengthFiles;
            Img = imread(strcat('fengedezifu\',Files(i).name));
            if(mod(i,20))
                 I{1}=[I{1} Img per]; 
                 if(i==LengthFiles)
                     for j=1:(4-mod(i,4))
                         I{1}=[I{1} per per];
                     end
                     disp(size(I{1},2));
                     disp(size(I{2},2));
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
         B=I{2};
%  figure,imshow(I{2});
else
    % g =bwareaopen(g,5);
%     figure,imshow(g1);
level = graythresh(a);
g=im2bw(a ,level);
% figure,imshow(g);
g=~g;
% figure,imshow(g);
f = zeros(50,2,'double');
  tarf = 1;
  [m,~] = size(g);
  I{3} = g;
  I{4} = I{3};
  se = strel('line',20,0);
  I{3} = imdilate(I{3},se);
%   figure,imshow(I{3});
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
       H=sum(I{6});
      [m1,n1]=size(I{6});
    for i1=1:n1
        if H(1,i1)~=0
            p1=i1;
            break;
        end
    end
    for j1=n1:-1:p1
        if H(1,j1)~=0
            f1=j1;
            break;
        end
    end
      I{6} = I{6}(:,p1:f1);
      I{6} = imresize(I{6},[36 20]);
      imwrite(I{6},['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');
      tara = tara+1;
  end
  per = zeros(36,20,'uint8');
  Files = dir(strcat('fengedezifu\','*.jpg'));
        LengthFiles = length(Files);
        for i = 1:LengthFiles;
            Img = imread(strcat('fengedezifu\',Files(i).name));
            if(mod(i,20))
                 I{1}=[I{1} Img per]; 
                 if(i==LengthFiles)
                     for j=1:(4-mod(i,4))
                         I{1}=[I{1} per per];
                     end
                     disp(size(I{1},2));
                     disp(size(I{2},2));
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
         B=I{2};
%  figure,imshow(I{2});
end
else
%     d=BJxc(c);
% % figure,imshow(d);title('背景消除后图像', 'FontWeight', 'Bold');
thresh=graythresh(c);%Otsu二值化
d=im2bw(c,thresh);
% figure,imshow(d);
    numVal_1 = sum(sum(d));
    numVal_0=length(find(d==0));
if(numVal_1<numVal_0)
    d=BJxc(c);
% figure,imshow(d);title('背景消除后图像', 'FontWeight', 'Bold');
thresh=graythresh(d);%Otsu二值化
e=im2bw(d,thresh);
% figure,imshow(e);
g1 =bwareaopen(e,50);
%     figure,imshow(g1);
    H=sum(g1');
    for i=1:height
        if H(1,i)~=0
            p1=i;
            break;
        end
    end
    for j1=p1:height
        if H(1,j1)==0
            e=g1(1:j1,:);
            f1=g1(j1:height,:);
            break;
        end
    end
    
    H1=sum(f1');
    [m,n]=size(f1);
    for k=1:m
        if H1(1,k)~=0
            p=k;
            break;
        end
    end
    for j=p:m
        if H1(1,j)==0
            h=f1(1:j,:);  
            l=f1(j:m,:);
            break;   
        end       
    end
%     figure;
%     subplot(4,1,1);imshow(e);
%     subplot(4,1,2);imshow(f1);
%     subplot(4,1,3);imshow(h);
%     subplot(4,1,4);imshow(l);
Files = dir(strcat('fengedezifu\','*.jpg'));
LengthFiles = length(Files);
for i1 = 1:LengthFiles
    delete(['fengedezifu\',Files(i1).name]);
end
S={e,h,l};
L=length(S);
tara = 1;
for p=1:L
f = zeros(50,2,'double');
tarf = 1;
[~,n1] = size(S{1,p});
I{3} =S{1,p};
I{4} = I{3};
se = strel('line',20,90);
I{3} = imdilate(I{3},se);
% figure,imshow(I{3});
for tary=1:n1
    if(sum(I{3}(:,tary))>5)
        if(f(tarf,1)==0)
            f(tarf,1) = tary;
        end
    elseif(f(tarf,1)>0)
        f(tarf,2) = tary;
        tarf = tarf + 1;
    end
end
% tara = 1;
  for i2=1:tarf-1
      I{3}(:,f(i2,1)) = 1;
      I{3}(:,f(i2,2)) = 1;
      I{6} = I{4}(:,f(i2,1):f(i2,2));
      H=sum(I{6}');
      [m1,n1]=size(I{6});
    for i1=1:m1
        if H(1,i1)~=0
            p1=i1;
            break;
        end
    end
    for j1=m1:-1:p1
        if H(1,j1)~=0
            f1=j1;
            break;
        end
    end
      I{6} = I{6}(p1:f1,:);
      I{6} = imresize(I{6},[36 20]);
      imwrite(I{6},['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');
%       if p==1
%       imwrite(I{6},['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');
%       elseif p==2
%           imwrite(I{6},['fengedezifu1\',sprintf('%03d',tara),'.jpg'],'jpg');
%       else
%           imwrite(I{6},['fengedezifu2\',sprintf('%03d',tara),'.jpg'],'jpg');
%       end
      tara = tara+1;
  end
end
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
         B=I{2};
% figure,imshow(I{2});
else
       
%     g1 =bwareaopen(e,50);
%     figure,imshow(g1); 
        d=~d;
%         figure,imshow(d);
        g1 =bwareaopen(d,60);
%     figure,imshow(g1);
    H=sum(g1');
    for i=1:height
        if H(1,i)~=0
            p1=i;
            break;
        end
    end
    for j1=p1:height
        if H(1,j1)==0
            e=g1(p1:j1,:);
            f1=g1(j1:height,:);
            break;
        end
    end
    
    H1=sum(f1');
    [m,n]=size(f1);
    for k=1:m
        if H1(1,k)~=0
            p=k;
            break;
        end
    end
    for j=p:m
        if H1(1,j)==0
            h=f1(p:j,:);  
            l=f1(j:m,:);
            break;   
        end       
    end
%     figure;
%     subplot(4,1,1);imshow(e);
%     subplot(4,1,2);imshow(f1);
%     subplot(4,1,3);imshow(h);
%     subplot(4,1,4);imshow(l);
Files = dir(strcat('fengedezifu\','*.jpg'));
LengthFiles = length(Files);
for i1 = 1:LengthFiles
    delete(['fengedezifu\',Files(i1).name]);
end
S={e,h,l};
L=length(S);
tara = 1;
for p=1:L
f = zeros(50,2,'double');
tarf = 1;
[~,n1] = size(S{1,p});
I{3} =S{1,p};
I{4} = I{3};
se = strel('line',20,90);
I{3} = imdilate(I{3},se);
% figure,imshow(I{3});
for tary=1:n1
    if(sum(I{3}(:,tary))>5)
        if(f(tarf,1)==0)
            f(tarf,1) = tary;
        end
    elseif(f(tarf,1)>0)
        f(tarf,2) = tary;
        tarf = tarf + 1;
    end
end
% tara = 1;
  for i2=1:tarf-1
      I{3}(:,f(i2,1)) = 1;
      I{3}(:,f(i2,2)) = 1;
      I{6} = I{4}(:,f(i2,1):f(i2,2));
      H=sum(I{6}');
      [m1,n1]=size(I{6});
    for i1=1:m1
        if H(1,i1)~=0
            p1=i1;
            break;
        end
    end
    for j1=m1:-1:p1
        if H(1,j1)~=0
            f1=j1;
            break;
        end
    end
      I{6} = I{6}(p1:f1,:);
      I{6} = imresize(I{6},[36 20]);
      imwrite(I{6},['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');
%       if p==1
%       imwrite(I{6},['fengedezifu\',sprintf('%03d',tara),'.jpg'],'jpg');
%       elseif p==2
%           imwrite(I{6},['fengedezifu1\',sprintf('%03d',tara),'.jpg'],'jpg');
%       else
%           imwrite(I{6},['fengedezifu2\',sprintf('%03d',tara),'.jpg'],'jpg');
%       end
      tara = tara+1;
  end
end
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
% d=imread('12.jpg');
% axes(h_axes3),imshow(d);
 B=I{2};
%         figure,imshow(I{2});
    end
end
