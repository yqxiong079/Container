% clear all;
% clc;

function vector = feExtraction(I)

count=zeros(1,45);
[m,n]=size(I);

t=1;
for j=1:4:m-3
    for i=1:4:n-3
        for k=1:3
            for l=1:3
                if I(j+k,i+l)>=200
                    count(t)=count(t)+1;
                end
            end
        end
        t=t+1;
    end
end
vector=count;