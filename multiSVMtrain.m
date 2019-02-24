%生成多元素svm分类器%
function [multiSVMstruct]=multiSVMtrain(traindata,nclass,gamma,c)
%(训练数据，元素数，gamma，c)%
for i=1:nclass-1
    for j=i+1:nclass
        %取训练数据，批量2分类，如X[traindata(0:5,:),traindata(6:10,:)]%
        X=[traindata(5*(i-1)+1:5*i,:);traindata(5*(j-1)+1:5*j,:)];
        %建立空矩阵存标签%
        Y=[ones(5,1);zeros(5,1)];
        %生成分类器组，如multiSVMstruct{1}{2}%
        multiSVMstruct{i}{j}=svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sqrt(1/2/gamma),'boxconstraint',c);
        
    end
end
