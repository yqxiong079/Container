   function CharacterRecognition(  )
   global xianghao;
%    global text1;
   load  data;
   model = svmtrain(label,vectors,'-s 0 -t 0'); 
   v= zeros(0,0);
   Files = dir(strcat('fengedezifu\','*.jpg'));
   LengthFiles = length(Files);
   for i = 1:LengthFiles
       Img = imread(strcat('fengedezifu\',Files(i).name));
       v1 = feExtraction(Img);
       v = [v;v1];
   end
    lab=zeros(size(v,1),1);
    [pre,accu]=svmpredict(lab,v,model); 
       xianghao = 'œ‰∫≈Œ™£∫';
    for prei=1:size(pre)
        if(pre(prei)>9)
            xianghao = [xianghao,char(pre(prei)),';'];
        else
            xianghao = [xianghao,num2str(pre(prei)),';'];
        end
    end
%       set(text1,'string',xianghao);
        text(900,25,xianghao,'fontsize',15,'Color','r','FontName','¡• È','FontWeight','bold');
   end