function [pcaA,V]=slpca(A,k,mA) %(����,����������ά�ȣ�ƽ����)
m=size(A,1);
n=size(A,2);
Z=(A-repmat(mA,m,1));%��ȥƽ����
T=(Z'*Z)/(n-1);%�������
[V,D]=eigs(T,k);%��T�����k������ֵ����������
pcaA=Z*V;


end