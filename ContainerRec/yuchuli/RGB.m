clc;
clear;
close all;
I=imread('1.jpg');
figure,imshow(I);
R=I(:,:,1);
figure,imshow(R);
% figure,imhist(R);title('R的直方图');
% [countsr,xr] = imhist(R);
% figure,plot(xr,countsr);title('R的曲线图');
G=I(:,:,2);
figure,imshow(G);
% figure,imhist(G);title('G的直方图');
% [countsg,xg] = imhist(G);
% figure,plot(xg,countsg);title('G的曲线图');
B=I(:,:,3);
figure,imshow(B);
% figure,imhist(B);title('B的直方图');
% [countsb,xb] = imhist(B);
% figure,plot(xb,countsb);title('B的曲线图');
[mr,nr]=size(R);         
ar = zeros(1,206) ;
% for ir=1:206
%     ar(ir)=length(find(R>=ir-1&R<=ir+49));
% end
for kr=1:206
    for ir=1:mr
     for jr=1:nr
         if R(ir,jr)>=kr-1&&R(ir,jr)<=kr+49
             ar(kr)=ar(kr)+1;
         end
     end
    end   
end
figure,plot(ar);title('R的改进曲线图');
[mg,ng]=size(G);         
ag = zeros(1,206) ;
% for ig=1:206
%     ag(ig)=length(find(G>=ig-1&G<=ig+49));
% end
for kg=1:206
    for ig=1:mg
     for jg=1:ng
         if G(ig,jg)>=kg-1&&G(ig,jg)<=kg+49
             ag(kg)=ag(kg)+1;
         end
     end
    end   
end
figure,plot(ag);title('G的改进曲线图');
[mb,nb]=size(B);         
ab = zeros(1,206) ;
% for ib=1:206
%     ab(ib)=length(find(B>=ib-1&B<=ib+49));
% end
for kb=1:206
    for ib=1:mb
     for jb=1:nb
         if B(ib,jb)>=kb-1&&B(ib,jb)<=kb+49
             ab(kb)=ab(kb)+1;
         end
     end
    end   
end
figure,plot(ab);title('B的改进曲线图');
% averR=sum(ar)/206;
% % averR=mean(ar);
% averG=sum(ag)/206;
% % averG=mean(ag);
% averB=sum(ab)/206;
% % averB=mean(ab);
maxr=max(ar);
maxg=max(ag);
maxb=max(ab);
if maxr>maxg&&maxr>maxb
    for kr=1:206
        for ir=1:mr
            for jr=1:nr
                if ar(kr)>0.1*maxr
                    if R(ir,jr)>=kr-1&&R(ir,jr)<=kr+49
                        R(ir,jr)=0;
                    end
                end
            end
        end   
    end
    figure,imshow(R);
elseif maxg>maxr&&maxg>maxb
        for kg=1:206
            for ig=1:mg
                for jg=1:ng
                    if ag(kg)>0.1*maxg
                        if G(ig,jg)>=kg-1&&G(ig,jg)<=kg+49
                            G(ig,jg)=0;
                        end
                    end
                end
            end   
        end
figure,imshow(G);
 elseif maxb>maxr&&maxb>maxg
        for kb=1:206
            for ib=1:mb
                for jb=1:nb
                    if ab(kb)>0.1*maxb
                        if B(ib,jb)>=kb-1&&B(ib,jb)<=kb+49
                            B(ib,jb)=0;
                        end
                    end
                end
            end   
       end
figure,imshow(B);
end

