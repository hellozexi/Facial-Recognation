close all;
tic;
for ratio=1:2:99 %��1ÿ��2�ӵ�99
    maxsize=1000;
    step=10;
    maxsize1=maxsize*ratio/100;
    data1=randn(maxsize1,2)*100;%�������������%
    data1(:,1)=data1(:,1)+(1:maxsize1)';
    data1(:,2)=data1(:,2)+(1:maxsize1)';
    %scatter(data1(:,1),data1(:,2),5,'r');
    
    maxsize2=maxsize*(100-ratio)/100;
    data2=randn(maxsize2,2)*100;%�������������%
    data2(:,1)=data2(:,1)-(1:maxsize2)';
    data2(:,2)=data2(:,2)+(1:maxsize2)';
   % scatter(data2(:,1),data2(:,2),5,'r');
    
    data=[data1',data2']';
   % scatter(data(:,1),data(:,2),5,'r');%��x����,y����,��Χ����ɫ��
    k=1;
    meanvalue=mean(data);
    [lowData,eigV]=fpca(data,k,meanvalue);
    reconMat=lowData*eigV'+repmat(meanvalue,[maxsize,1]);
    
    figure
    scatter(data(:,1),data(:,2),5,'r');
    hold on
    scatter(reconMat(:,1),reconMat(:,2),5,'g');
    hold off
end
toc;
   