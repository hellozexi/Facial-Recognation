%ƽ��������%
%��ȡ����%
facestore=readface('.\����ʶ��self\orl_faces');
%�����ж��ٸ���%
nfaces=size(facestore,1);
%ƽ��ֵ%
meanvalue=mean(facestore);
%��ֻ��һ�е�ƽ��ֵת��Ϊ112*92�ľ��󣨼�ͼƬ��%
imgm=reshape(meanvalue,[112,92]);
%ת��Ϊuint8���%
figure,imshow(uint8(imgm));
        
    