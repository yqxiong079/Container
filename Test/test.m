% data = xlsread('data.xlsx','Sheet1');
% save data.mat data
tic;
load data;
load model;
lab= data(1:72,46);
v=data(1:72,1:45);
[pre,Accuracy]=svmpredict(lab,v,model);
toc;
time=strcat('运行时间：',num2str(toc),'s');
accuracy=strcat('准确率：',num2str(round(Accuracy(1))),'%');