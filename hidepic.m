%��ȡͼƬ��img1Ϊ���ڲ�ͼ��������img2ΪҪ����������ͼ%
%��ͼΪRGB��8λ���ڰ�ͼֻ��8λ%
img1=imread('C:\Users\Paragon\Desktop\������ҵ\day1\homework1\faces\image_0071.jpg');
img2=imread('C:\Users\Paragon\Desktop\������ҵ\day1\homework1\gray\image_0001.BMP');
%img1=double(img1);����һ�ַ�����ǰ��
%img2=double(img2);

%hide process%
%��ͼ2���ڰף�����6λ����ͬ�ڳ���2��6�η����ο�ʮ�������ƣ�
%x1�洢�˺ڰ�ͼ8λ��ǰ��λ����λ��ĩβ
x1=bitshift(uint8(img2),-6);
%��ɺ�ֻʣǰ��λ����Ϊ��6λ����û��

%x1=floor(img1(:,:,1)/4*4+img2/64);��һ������������λ�ƣ�
%x2=floor(img1(:,:,2)/4*4+img2*4);

%���ڰ�ͼ8λ��������2λ������6λ������ֻʣ3��4λ����λ��ĩβ
%x2�洢3,4λ
x2=bitshift(uint8(img2),2);
x2=bitshift(uint8(x2),-6);
%x3ͬ���洢56λ����λ��ĩβ
x3=bitshift(uint8(img2),4);
x3=bitshift(uint8(x3),-6);

%�����ں�ͼ�ĳ�ʼ����
imgfuse=img1;

%�ֱ��ں�ͼ��R,G,B����2λ������2λ���������һλ�Ϳ���
%Ȼ��ֱ����x1,x2,x3�������ͰѺڰ�ͼ��������
imgfuse(:,:,1)=bitshift(uint8(img1(:,:,1)),-2);
imgfuse(:,:,1)=bitshift(uint8(imgfuse(:,:,1)),2)+x1;
imgfuse(:,:,2)=bitshift(uint8(img1(:,:,2)),-2);
imgfuse(:,:,2)=bitshift(uint8(imgfuse(:,:,2)),2)+x2;
imgfuse(:,:,3)=bitshift(uint8(img1(:,:,3)),-2);
imgfuse(:,:,3)=bitshift(uint8(imgfuse(:,:,3)),2)+x3;

%��ʾ�ں�ͼ
figure,imshow(uint8(imgfuse));

%extract%
%��ԭ���ص�ͼ
%���ں�ͼ��RGB�ֱ�����6λ��Ȼ����������0,2,4λ����ȡ�ڰ�ͼ��12,34,56λ
%�Ҵ�����ȷ��λ��
y1=bitshift(uint8(imgfuse(:,:,1)),6);
y2=bitshift(uint8(imgfuse(:,:,2)),6);
y2=bitshift(uint8(y2),-2);
y3=bitshift(uint8(imgfuse(:,:,3)),6);
y3=bitshift(uint8(y3),-4);
%��12,34,56λ��ӣ��͵õ��ڰ�ͼ��
imgrec=y1+y2+y3;
%չʾ�ڰ�ͼ
figure,imshow(uint8(imgrec));





