load data;
Files = dir(strcat('fengedezifu\','*.jpg'));
Img = imread(strcat('fengedezifu\',Files(5).name));
v1 = feExtraction(Img);
vectors = [vectors;v1];
label=[label;3];
save('data.mat','label','vectors');
