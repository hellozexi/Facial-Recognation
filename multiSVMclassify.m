%使用多元素svm识别图片%
function [class]=multiSVMclassify(testdata,multiSVMstruct,nclass)
%采用投票逻辑，比如拿一个1作为测试图片%
%分别用0/1,0/2,0/3...8/9这45个2分分类器检测，不是1的数字应当得到差不多的投票%
%但是，包含1的分类器(0/1,1/2,1/3,...1/9)会给1投很多票，使1得到最多票数%
%即识别出图片数字%
m=size(testdata,1);
voting=zeros(m,nclass);
for i=1:nclass-1
    for j=i+1:nclass
        class=svmclassify(multiSVMstruct{i}{j},testdata);
        voting(:,i)=voting(:,i)+(class==1);
        voting(:,j)=voting(:,j)+(class==0);
    end
end
[~,class]=max(voting,[],2);
end
