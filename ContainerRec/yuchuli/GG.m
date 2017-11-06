clc,clear,close all;
I=imread('1.jpg');
figure,imshow(I);
 G=I(:,:,2);
% figure,imshow(G);
% figure,imhist(G);title('G的直方图');
% [counts,x] = imhist(G);
% figure,plot(x,counts);title('G的曲线图');
[m,n]=size(G);         
a = zeros(1,206) ;
% for i=1:206
%     a(i)=length(find(G>=i-1&G<=i+49));
% end
for k=1:206
    for i=1:m
     for j=1:n
         if G(i,j)>=k-1&&G(i,j)<=k+49
             a(k)=a(k)+1;
         end
     end
    end   
end
figure,plot(a);title('G的改进曲线图');
maxg=max(a);
% averG=sum(a)/206;
% averG=mean(a);
for k=1:206
    for i=1:m
     for j=1:n
         if a(k)>0.1*maxg
             if G(i,j)>=k-1&&G(i,j)<=k+49
              G(i,j)=0;
             end
         end
     end
    end   
end
figure,imshow(G);