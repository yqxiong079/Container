clc,clear,close all;
I=imread('1.jpg');
figure,imshow(I);
 B=I(:,:,3);
% figure,imshow(B);
% figure,imhist(B);title('B的直方图');
% [counts,x] = imhist(B);
% figure,plot(x,counts);title('B的曲线图');
[m,n]=size(B);         
a = zeros(1,206) ;
% for i=1:206
%     a(i)=length(find(B>=i-1&B<=i+49));
% end
for k=1:206
    for i=1:m
     for j=1:n
         if B(i,j)>=k-1&&B(i,j)<=k+49
             a(k)=a(k)+1;
         end
     end
    end   
end
figure,plot(a);title('B的改进曲线图');
maxb=max(a);
% averB=sum(a)/206;
% averB=mean(a);
for k=1:206
    for i=1:m
     for j=1:n
         if a(k)>0.2*maxb
             if B(i,j)>=k-1&&B(i,j)<=k+49
              B(i,j)=0;
             end
         end
     end
    end   
end
figure,imshow(B);