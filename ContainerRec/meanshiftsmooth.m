function B1 = meanshiftsmooth(A,hr,hs,method)
if(nargin <4)
    method = 'guass';
end
[row,col,dim] = size(A);
A = double(A);
if dim==1
    disp('灰度图');
elseif dim==3
    disp('彩色图');
    A =rgb2gray(A);
else
    error('不知是何种图像！');
end
B = A;
if(hr <=0 || hs <=0)
    error('窗宽不能为负');
end
%   只考虑离当前点距离在 2*hs 内的点
h = 2*hs;
[kmatrix,row_matirx,col_matrix] = kernelmatrix(hs,method,h);
for i = 1:row %5:5,%
    for j = 1:col %5:5,
        if (i- h -1)>=0
            kleftup.row = 1;
        else
            kleftup.row = h + 2 - i;
        end     
        if(j-h - 1)>=0
            kleftup.col = 1;
        else
            kleftup.col = h + 2 - j;
        end    
        if (row - i - h) >=0
            krightdown.row = 2*h + 1;
        else
            krightdown.row = row - i + h +1;
        end 
        if (col- j - h) >=0
            krightdown.col = 2*h + 1;
        else
            krightdown.col = col - j + h +1;
        end 
        s_weight = kmatrix(kleftup.row :krightdown.row,...
            kleftup.col:krightdown.col);       
        row_matirx_temp = row_matirx(kleftup.row :krightdown.row,...
            kleftup.col:krightdown.col);
        col_matirx_temp = col_matrix(kleftup.row :krightdown.row,...
            kleftup.col:krightdown.col);     
        Aleftup.row = i - (h +1 - kleftup.row);
        Aleftup.col = j - (h +1 - kleftup.col);      
        Arightdown.row = i + (krightdown.row - h -1);
        Arightdown.col = j + (krightdown.col - h -1);    
        r_A = A(Aleftup.row :Arightdown.row,...
            Aleftup.col:Arightdown.col);     
        R_A = r_A - A(i,j);
        R_A = R_A.^2;
        r_weight = exp(-R_A./(hr.^2));
        weight = r_weight.*s_weight;    
        temp_row = sum(sum(weight.*row_matirx_temp));
        temp_col = sum(sum(weight.*col_matirx_temp));       
        value = sum(sum(r_A.*weight));
        value1 = sum(sum(weight));
        B(i,j) =  value/(value1+eps);
    end
end
B1 = uint8(B);
% imshow(B1)
end
