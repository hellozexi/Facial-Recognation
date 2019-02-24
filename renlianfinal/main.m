clc;
clear;
nps=43;%40����

%��ȡѵ������%
[f_matrix,tclass]=readface(nps,0);
nfaces=size(f_matrix,1);%����������

%pca������ά%
mA=mean(f_matrix);%ƽ����
%for k=70:5:90
k=80;%ά��
[pcaface,V]=fpca(f_matrix,k,mA);

%ѵ������scaling��%
lowvec=min(pcaface);
upvec=max(pcaface);
pcaface = scaling( pcaface,lowvec,upvec);

%����ѵ��%
%for gamma=0.0005:0.0001:0.0015
gamma=0.001;%gamma%
%for c=80:5:120
c=100;%�ͷ���%
multiSVMstruct=multiSVMtrain( pcaface,nps,gamma,c);
%SVMStruct = multi_svmtrain_h(pcaface, tclass, gamma, c);%һ��SVM%

%��ȡ��������%
% [testface,rclass]=readface(nps,1);%��ȡ���в�������%

%��ȡָ����%
m=41;%��ȡ��m����%
n=9;%��n����Ƭ%
[testface,rclass]=readmyface(m,n);%��ȡָ����(�ڼ����ˣ��ڼ�����Ƭ)%


%pca��������,������ά%
m=size(testface,1);
for i=1:m
    testface(i,:)=testface(i,:)-mA;%��ȥѵ�����ݵ�ƽ��ֵ������ֻ�Ƚϲ�֮ͬ��%
end
pcatestface=testface*V;%����ѵ�����ݵ�����������ӳ����ͬһֱ���ϣ�ֻ�Ƚϵ�Ĳ�ͬ%
%���������Ϊб�ʲ���Ӱ��ƥ���%

%��������scaling��%
tlowvec=min(pcatestface);
tupvec=max(pcatestface);
pcatestface = scaling( pcatestface,tlowvec,tupvec);

%svm����ʶ��%
testclass= multiSVMclassify(pcatestface,multiSVMstruct,nps);%������������%
%testclass=multi_svmclassify_h(SVMStruct, pcatestface);%һ��SVM����%
% trainclass= multiSVMclassify(pcaface,multiSVMstruct,nps);%ѵ����������%
%trainclass=multi_svmclassify_h(SVMStruct, pcaface);%һ��SVM����%

%ָ�����ж�%
if testclass==rclass
    display(['�ж�Ϊ��',num2str(testclass),'����']);
    display(['��Ϊ��',num2str(rclass),'���ˣ��ж���ȷ']);
    imgrec=imread(strcat('.\orl_faces\s',num2str(testclass),'\1.pgm'));
    figure,imshow(imgrec);%��ʾ���Ե�ʶ����������һ����Ƭ%
    imgans=imread(strcat('.\orl_faces\s',num2str(rclass),'\',num2str(n),'.pgm'));
    figure,imshow(imgans);%��ʾ�𰸣�������Ĳ�����Ƭ%
else
    display(['�ж�Ϊ��',num2str(testclass),'����']);
    display(['��Ϊ��',num2str(rclass),'���ˣ��жϴ���']);
    imgrec=imread(strcat('.\orl_faces\s',num2str(testclass),'\1.pgm'));
    figure,imshow(imgrec);%��ʾ���Ե�ʶ����������һ����Ƭ%
    imgans=imread(strcat('.\orl_faces\s',num2str(rclass),'\',num2str(n),'.pgm'));
    figure,imshow(imgans);%��ʾ�𰸣�������Ĳ�����Ƭ%
end
%ָ�����ж�%

%��ȷ�ʼ���%
% testcp=sum(testclass==rclass)/length(testclass);
% display(['������ȷ�ʣ�',num2str(testcp)]);
% traincp=sum(trainclass==tclass)/length(trainclass);
% display(['ѵ����ȷ�ʣ�',num2str(traincp)]);


% end
% end
% end
