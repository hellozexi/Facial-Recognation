%读取图片，img1为用于藏图的容器，img2为要被藏起来的图%
%彩图为RGB各8位，黑白图只有8位%
img1=imread('C:\Users\Paragon\Desktop\各种作业\day1\homework1\faces\image_0071.jpg');
img2=imread('C:\Users\Paragon\Desktop\各种作业\day1\homework1\gray\image_0001.BMP');
%img1=double(img1);另外一种方法的前提
%img2=double(img2);

%hide process%
%将图2（黑白）右移6位（等同于除以2的6次方，参考十进制右移）
%x1存储了黑白图8位的前两位，且位于末尾
x1=bitshift(uint8(img2),-6);
%完成后只剩前两位，因为后6位被挤没了

%x1=floor(img1(:,:,1)/4*4+img2/64);另一方法（除法来位移）
%x2=floor(img1(:,:,2)/4*4+img2*4);

%将黑白图8位数据左移2位再右移6位，这样只剩3，4位，且位于末尾
%x2存储3,4位
x2=bitshift(uint8(img2),2);
x2=bitshift(uint8(x2),-6);
%x3同理，存储56位，且位于末尾
x3=bitshift(uint8(img2),4);
x3=bitshift(uint8(x3),-6);

%设置融合图的初始数据
imgfuse=img1;

%分别将融合图的R,G,B右移2位并左移2位，这样最后一位就空了
%然后分别加上x1,x2,x3，这样就把黑白图藏起来了
imgfuse(:,:,1)=bitshift(uint8(img1(:,:,1)),-2);
imgfuse(:,:,1)=bitshift(uint8(imgfuse(:,:,1)),2)+x1;
imgfuse(:,:,2)=bitshift(uint8(img1(:,:,2)),-2);
imgfuse(:,:,2)=bitshift(uint8(imgfuse(:,:,2)),2)+x2;
imgfuse(:,:,3)=bitshift(uint8(img1(:,:,3)),-2);
imgfuse(:,:,3)=bitshift(uint8(imgfuse(:,:,3)),2)+x3;

%显示融合图
figure,imshow(uint8(imgfuse));

%extract%
%还原隐藏的图
%把融合图的RGB分别左移6位，然后依次右移0,2,4位，获取黑白图的12,34,56位
%且处于正确的位置
y1=bitshift(uint8(imgfuse(:,:,1)),6);
y2=bitshift(uint8(imgfuse(:,:,2)),6);
y2=bitshift(uint8(y2),-2);
y3=bitshift(uint8(imgfuse(:,:,3)),6);
y3=bitshift(uint8(y3),-4);
%将12,34,56位相加，就得到黑白图了
imgrec=y1+y2+y3;
%展示黑白图
figure,imshow(uint8(imgrec));





