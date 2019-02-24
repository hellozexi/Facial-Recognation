%ʹ�ö�Ԫ��svmʶ��ͼƬ%
function [class]=multiSVMclassify(testdata,multiSVMstruct,nclass)
%����ͶƱ�߼���������һ��1��Ϊ����ͼƬ%
%�ֱ���0/1,0/2,0/3...8/9��45��2�ַ�������⣬����1������Ӧ���õ�����ͶƱ%
%���ǣ�����1�ķ�����(0/1,1/2,1/3,...1/9)���1Ͷ�ܶ�Ʊ��ʹ1�õ����Ʊ��%
%��ʶ���ͼƬ����%
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
