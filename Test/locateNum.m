function [ direction, output_line, new_img,tempLeft,tempRight ] = locateNum( input_img, old_img )
    I{1} = input_img;
    I{2} = I{1};
    [m,n]=size(I{2});%获得图像的长宽
    validMark = 0;
    direction = 0;
    output_line = 0;
    %做定位的标记，1连续黑的次数，2连续白的次数，3上边界，4下边界,5记录的黑色
    tarP{5} = 0;
    for i=1:5
        tarP{i} = 0;
    end
%     figure;subplot(2,2,1);plot(sum(I{2}'));title('水平投影');
%     subplot(2,2,2);imshow(I{2});
%     subplot(2,2,4);plot(sum(I{2}));title('垂直投影');
%% 下面是对图像横箱号定位
    I{3} = I{2};
    for tarx=1:m
        if(sum(I{3}(tarx,:))<30)
            I{3}(tarx,:)=0;%图像全黑的,tarP{1}加1
        elseif(sum(I{3}(tarx,:))>80) %图像白色点大于5的，tarP{2}加1
           I{3}(tarx,:)=0;%图像全黑的,tarP{1}加1
        end
    end
    for tarx=1:m
        if(sum(I{3}(tarx,:))==0)
            tarP{1} = tarP{1}+1;               
                if(tarP{2}<15&&tarP{2}>2)%如果到黑点时图像的连续白色点小于15大于5，白色点数重置
                    tarP{2} = 0;
                    tarP{4} = 0;
                    tarP{3} = 0;
    %                 disp(['清空P2:',num2str(tarx)]);
                end        
                if(tarP{3}>0)
                    tarP{4} = tarx;
%                         disp(['下边界定位成功:',num2str(tarP{4}),';',num2str(tarP{3})]);
                    if((tarP{4}-tarP{3})>20&&(tarP{4}-tarP{3})<40)                         
                            validMark = 1;
                            break;
                    else
                        tarP{4}=0;
                        tarP{3}=0;
                    end
                else
                    tarP{5} = tarx;
                end
        else
          tarP{2} = tarP{2}+1;
            if(tarP{2}>2)
                if(tarP{3}==0)
                    tarP{3} = tarP{5};
    %                     disp(['上边界定位成功:',num2str(tarP{3})]);
        %             break;
                end
             end
            tarP{1} = 0;
        end
    end
    if(validMark==1)
        for i=0:3
            I{2}(tarP{3}-4+i,:)=1;
            I{2}(tarP{4}+4-i,:)=1;
        end
        output_line = tarP;
        direction = 1;
        if iscell(output_line)
        output_line=cell2mat(output_line);
        end
        if (output_line~=0)          
                 com=zeros(1,n);
for j=1:n %对水平定位出的箱号区域做垂直投影
    for i=output_line(1,3):output_line(1,4)
        if I{1}(i,j)~=0
            com(j)=com(j)+1;
        end
    end
end

for j=1:n %定位箱号区域的左边界
    if com(j)>4
        tempLeft=j;
        break;
    end
end
for j=n:-1:tempLeft+1 %定位箱号区域的左边界
    if com(j)>14
        tempRight=j;
        break;
    end
end
        else
            tempLeft=0;
            tempRight=0;
        end
    end
    
%% 下面是对图像纵箱号定位
   if(validMark==0)
    for i=1:5
        tarP{i} = 0;
    end
     I{4} = I{2};
    for tary=1:n
        if(sum(I{4}(:,tary))<30)
            I{4}(:,tary)=0;%图像全黑的,tarP{1}加1
        elseif(sum(I{4}(:,tary))>80) %图像白色点大于5的，tarP{2}加1
           I{4}(:,tary)=0;%图像全黑的,tarP{1}加1
        end
    end
       
    for tary=1:n
        if(sum(I{4}(:,tary))==0)
            tarP{1} = tarP{1}+1;
            if(tarP{1}>5)
                if(tarP{3}>0)
                    tarP{4} = tary;
%                             disp(['右边界定位成功:',num2str(tarP{4}),';',num2str(tarP{3})]);
                    if((tarP{4}-tarP{3})>10)
                            validMark = 2;
                            break;
                    else
                        tarP{4}=0;
                        tarP{3}=0;
                    end
                else
                    tarP{5} = tary;
                end

                if(tarP{2}<15&&tarP{2}>5)%如果到黑点时图像的连续白色点小于20大于5，白色点数重置
                    tarP{2} = 0;
    %                 disp(['清空P2:',num2str(tary)]);
                end
            end
        else
          tarP{2} = tarP{2}+1;
            if(tarP{2}>2)
                if(tarP{3}==0)
                    tarP{3} = tarP{5};
    %                     disp(['上边界定位成功:',num2str(tarP{3})]);
        %             break;
                end
             end
            tarP{1} = 0;
        end
    end

    if(validMark==2)
        cutImg = I{4}(:,tarP{3}-4:tarP{4}+4);
        for i=0:3
            I{2}(:,tarP{3}-4+i)=1;
            I{2}(:,tarP{4}+4-i)=1;
        end
        output_line = tarP;
        direction = 2;
    end
     if iscell(output_line)
        output_line=cell2mat(output_line);
        end
        if (output_line~=0)
        com=zeros(1,m);
for j=1:m %对水平定位出的箱号区域做垂直投影
    for i=output_line(1,3):output_line(1,4)
        if I{1}(j,i)~=0
            com(j)=com(j)+1;
        end
    end
end

for j=1:m %定位箱号区域的左边界
    if com(j)>0
        tempLeft=j;
        break;
    end
end
for j=m:-1:tempLeft+1 %定位箱号区域的左边界
    if com(j)>0
        tempRight=j;
        break;
    end
end 
        else
          tempLeft=0;
          tempRight=0;
        end
   end
   new_img = old_img;
end

