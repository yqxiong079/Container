load data;
Files = dir(strcat('fengedezifu\','*.jpg'));
Img = imread(strcat('fengedezifu\',Files(1).name));
v1 = feExtraction(Img);
vectors = [vectors;v1];
label=[label;84];
model = svmtrain(label,vectors,'-s 0 -t 0'); 
save('data.mat','label','vectors');
