img1=imread('C:\Users\Paragon\Desktop\������ҵ\day1\homework1\faces\image_0071.jpg');
%��ͼ���أ��ͺڰ�ͼ�������ƣ�ֻ�ǰѲ�ͼ��RGBǰ4λ�ֱ����ԭͼ��RGB��4λ��%
img2=imread('C:\Users\Paragon\Desktop\������ҵ\day1\homework1\faces\image_0001.jpg');
%img1=double(img1);
%img2=double(img2);


%hide process%
%��Ϊ������̶��ǣ�:,:,1/2/3��,��x,yֵ�����Ʒ�Χ����ʵ���
%����x,y�ķ�Χ���Ϳ�����һ�Ŵ�ͼ�����ܶ��Сͼ
%���磨0:99,0:99,rgb��,����x,y�ֱ�Ϊ0��100��Χ
x1=bitshift(uint8(img2(:,:,1)),-4);
%x1=floor(img1(:,:,1)/4*4+img2/64);
%x2=floor(img1(:,:,2)/4*4+img2*4)
x2=bitshift(uint8(img2(:,:,2)),-4);
x3=bitshift(uint8(img2(:,:,3)),-4);

imgfuse=img1;

imgfuse(:,:,1)=bitshift(uint8(img1(:,:,1)),-4);
imgfuse(:,:,1)=bitshift(uint8(imgfuse(:,:,1)),4)+x1;
imgfuse(:,:,2)=bitshift(uint8(img1(:,:,2)),-4);
imgfuse(:,:,2)=bitshift(uint8(imgfuse(:,:,2)),4)+x2;
imgfuse(:,:,3)=bitshift(uint8(img1(:,:,3)),-4);
imgfuse(:,:,3)=bitshift(uint8(imgfuse(:,:,3)),4)+x3;

figure,imshow(uint8(imgfuse));
imgrec=img1;
%extract%
imgrec(:,:,1)=bitshift(uint8(imgfuse(:,:,1)),4);
imgrec(:,:,2)=bitshift(uint8(imgfuse(:,:,2)),4);
imgrec(:,:,3)=bitshift(uint8(imgfuse(:,:,3)),4);
figure,imshow(uint8(imgrec));





