function [pcaA,V]=fpca(A,k,mA) %(数据,降低至多少维度，平均数)
m=size(A,1);%取第一列有多少行
Z=(A-repmat(mA,m,1));%减去平均数
T=Z*Z';%方差矩阵
[V,D]=eigs(T,k);%求T的最大k个特征值的特征向量
V=Z'*V;

%方法2%
% V=V/sqrt(D);

%方法1%
for i=1:k
    l=norm(V(:,i));
    V(:,i)=V(:,i)/l;%向量单位化%
end

%方法3%
% DiagD=diag(D);
% for i=1:k
%     V(:,i)=V(:,i)/sqrt(DiagD(i));
% end
%方法3%

pcaA=Z*V;
end
