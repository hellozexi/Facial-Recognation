%���ɶ�Ԫ��svm������%
function [multiSVMstruct]=multiSVMtrain(traindata,nclass,gamma,c)
%(ѵ�����ݣ�Ԫ������gamma��c)%
for i=1:nclass-1
    for j=i+1:nclass
        %ȡѵ�����ݣ�����2���࣬��X[traindata(0:5,:),traindata(6:10,:)]%
        X=[traindata(5*(i-1)+1:5*i,:);traindata(5*(j-1)+1:5*j,:)];
        %�����վ�����ǩ%
        Y=[ones(5,1);zeros(5,1)];
        %���ɷ������飬��multiSVMstruct{1}{2}%
        multiSVMstruct{i}{j}=svmtrain(X,Y,'kernel_function','rbf','rbf_sigma',sqrt(1/2/gamma),'boxconstraint',c);
        
    end
end
