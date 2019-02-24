img1=imread('C:\Users\Paragon\Desktop\各种作业\day1\homework1\faces\image_0071.jpg');
%彩图隐藏，和黑白图隐藏类似，只是把彩图的RGB前4位分别存在原图的RGB后4位里%
img2=imread('C:\Users\Paragon\Desktop\各种作业\day1\homework1\faces\image_0001.jpg');
%img1=double(img1);
%img2=double(img2);


%hide process%
%因为这个例程都是（:,:,1/2/3）,即x,y值不限制范围，其实如果
%限制x,y的范围，就可以在一张大图里面存很多个小图
%例如（0:99,0:99,rgb）,就是x,y分别为0到100范围
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





