   function [xianghao,Accuracy]=CharacterRecognition(  )
   load model.mat;
   v= zeros(0,0);
   Files = dir(strcat('fengedezifu\','*.jpg'));
   LengthFiles = length(Files);
   for i = 1:LengthFiles
       Img = imread(strcat('fengedezifu\',Files(i).name));
       v1 = feExtraction(Img);
       v = [v;v1];
   end
    lab=zeros(size(v,1),1);
    [pre,Accuracy]=svmpredict(lab,v,model); 
       xianghao = '';
    for prei=1:size(pre)
        if(pre(prei)>9)
            xianghao = [xianghao,char(pre(prei)),','];
        else
            xianghao = [xianghao,num2str(pre(prei)),','];
        end
    end
   end