clc,clear,close all;
I=imread('1.jpg');
figure,imshow(I);
 R=I(:,:,1);
% figure,imshow(R);
% figure,imhist(R);title('R的直方图');
% [counts,x] = imhist(R);
% figure,plot(x,counts);title('R的曲线图');
[m,n]=size(R);         
a = zeros(1,206) ;
% for i=1:206
%     a(i)=length(find(G>=i-1&G<=i+49));
% end
for k=1:206
    for i=1:m
     for j=1:n
         if R(i,j)>=k-1&&R(i,j)<=k+49
             a(k)=a(k)+1;
         end
     end
    end   
end
figure,plot(a);title('R的改进曲线图');
maxr=max(a);
% averR=sum(a)/206;
% averG=mean(a);
for k=1:206
    for i=1:m
     for j=1:n
         if a(k)>0.3*maxr
             if R(i,j)>=k-1&&R(i,j)<=k+49
              R(i,j)=0;
             end
         end
     end
    end   
end
figure,imshow(R);