clc;
clear;
nps=43;%40个人

%读取训练数据%
[f_matrix,tclass]=readface(nps,0);
nfaces=size(f_matrix,1);%人脸的数量

%pca特征降维%
mA=mean(f_matrix);%平均数
%for k=70:5:90
k=80;%维度
[pcaface,V]=fpca(f_matrix,k,mA);

%训练数据scaling化%
lowvec=min(pcaface);
upvec=max(pcaface);
pcaface = scaling( pcaface,lowvec,upvec);

%样本训练%
%for gamma=0.0005:0.0001:0.0015
gamma=0.001;%gamma%
%for c=80:5:120
c=100;%惩罚项%
multiSVMstruct=multiSVMtrain( pcaface,nps,gamma,c);
%SVMStruct = multi_svmtrain_h(pcaface, tclass, gamma, c);%一组SVM%

%读取测试数据%
% [testface,rclass]=readface(nps,1);%读取所有测试数据%

%读取指定脸%
m=41;%读取第m个人%
n=9;%第n张照片%
[testface,rclass]=readmyface(m,n);%读取指定脸(第几个人，第几张照片)%


%pca测试数据,特征降维%
m=size(testface,1);
for i=1:m
    testface(i,:)=testface(i,:)-mA;%减去训练数据的平均值，这样只比较不同之处%
end
pcatestface=testface*V;%乘以训练数据的特征向量，映射在同一直线上，只比较点的不同%
%不会出现因为斜率差异影响匹配度%

%测试数据scaling化%
tlowvec=min(pcatestface);
tupvec=max(pcatestface);
pcatestface = scaling( pcatestface,tlowvec,tupvec);

%svm人脸识别%
testclass= multiSVMclassify(pcatestface,multiSVMstruct,nps);%测试样本测试%
%testclass=multi_svmclassify_h(SVMStruct, pcatestface);%一组SVM测试%
% trainclass= multiSVMclassify(pcaface,multiSVMstruct,nps);%训练样本测试%
%trainclass=multi_svmclassify_h(SVMStruct, pcaface);%一组SVM测试%

%指定脸判断%
if testclass==rclass
    display(['判断为第',num2str(testclass),'个人']);
    display(['答案为第',num2str(rclass),'个人，判断正确']);
    imgrec=imread(strcat('.\orl_faces\s',num2str(testclass),'\1.pgm'));
    figure,imshow(imgrec);%显示电脑的识别结果，即第一张照片%
    imgans=imread(strcat('.\orl_faces\s',num2str(rclass),'\',num2str(n),'.pgm'));
    figure,imshow(imgans);%显示答案，即导入的测试照片%
else
    display(['判断为第',num2str(testclass),'个人']);
    display(['答案为第',num2str(rclass),'个人，判断错误']);
    imgrec=imread(strcat('.\orl_faces\s',num2str(testclass),'\1.pgm'));
    figure,imshow(imgrec);%显示电脑的识别结果，即第一张照片%
    imgans=imread(strcat('.\orl_faces\s',num2str(rclass),'\',num2str(n),'.pgm'));
    figure,imshow(imgans);%显示答案，即导入的测试照片%
end
%指定脸判断%

%正确率计算%
% testcp=sum(testclass==rclass)/length(testclass);
% display(['测试正确率：',num2str(testcp)]);
% traincp=sum(trainclass==tclass)/length(trainclass);
% display(['训练正确率：',num2str(traincp)]);


% end
% end
% end
