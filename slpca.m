function [pcaA,V]=slpca(A,k,mA) %(数据,降低至多少维度，平均数)
m=size(A,1);
n=size(A,2);
Z=(A-repmat(mA,m,1));%减去平均数
T=(Z'*Z)/(n-1);%方差矩阵
[V,D]=eigs(T,k);%求T的最大k个特征值的特征向量
pcaA=Z*V;


end