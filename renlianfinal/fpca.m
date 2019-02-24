function [pcaA,V]=fpca(A,k,mA) %(����,����������ά�ȣ�ƽ����)
m=size(A,1);%ȡ��һ���ж�����
Z=(A-repmat(mA,m,1));%��ȥƽ����
T=Z*Z';%�������
[V,D]=eigs(T,k);%��T�����k������ֵ����������
V=Z'*V;

%����2%
% V=V/sqrt(D);

%����1%
for i=1:k
    l=norm(V(:,i));
    V(:,i)=V(:,i)/l;%������λ��%
end

%����3%
% DiagD=diag(D);
% for i=1:k
%     V(:,i)=V(:,i)/sqrt(DiagD(i));
% end
%����3%

pcaA=Z*V;
end
