%平均脸计算%
%读取数据%
facestore=readface('.\人脸识别self\orl_faces');
%计算有多少个脸%
nfaces=size(facestore,1);
%平均值%
meanvalue=mean(facestore);
%将只有一行的平均值转换为112*92的矩阵（即图片）%
imgm=reshape(meanvalue,[112,92]);
%转换为uint8输出%
figure,imshow(uint8(imgm));
        
    