function [ output_data ] = verifyConDomain( input_img, bigintar, endtar, direction)
if(direction==1)
    sensitiveArea = input_img(bigintar:endtar,:);
    [row,column] = size(sensitiveArea);
    validRows = 0;
    for i=1:column
        if(sum(sensitiveArea(:,i))>0)
            validRows = validRows+1;
        end
    end
    meanData = sum(sensitiveArea(:))/validRows;
    for i=1:column
        if(sum(sensitiveArea(:,i))<(meanData/2))
            sensitiveArea(:,i)=0;
        end
    end
elseif(direction==2)
    sensitiveArea = input_img(:,bigintar:endtar);
    [row ,column] = size(sensitiveArea);
    validRows = 0;
    for i=1:row
        if(sum(sensitiveArea(i,:))>0)
            validRows = validRows+1;
        end
    end
    meanData = sum(sensitiveArea(:))/validRows;
    for i=1:row
        if(sum(sensitiveArea(i,:))<(meanData/2))
            sensitiveArea(i,:)=0;
        end
    end
end
        %下面是连通域的标记
    stats = regionprops(sensitiveArea,'all');
    statsLength = length(stats);
    I{4} = zeros(row,column,3,'uint8');
    effiNum = 0;
    for i=1:statsLength
            if(direction==1)
                %横向
                [m,n] = size(stats(i).Image);
            elseif(direction==2)
                %纵向
                [m,n] = size(stats(i).Image);
            end
            if(m>n)
                effiNum = effiNum+1;
            end
    end
    if(effiNum <8)
        output_data = 0;
    else
        output_data = 1;
    end
end

