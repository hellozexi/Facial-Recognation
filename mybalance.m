%直方图均衡化
%图片路径，包含图片完整名%
img1=imread('C:\Users\Paragon\Desktop\QQ图片20170804234453.bmp');
gray=rgb2gray(img1);
figure,imshow(gray);
count=zeros(1,300);
density=zeros(1,300);
c_density=zeros(1,300);
size1=ceil(300);
size2=ceil(300);

for i=1:size1
    for j=1:size2
        count(gray(i,j))=count(gray(i,j))+1;
    end
end
for i=1:size1
    for j=1:size2
    density(gray(i,j))=double(count(gray(i,j)))/90000;
    end
end
for i=1:size1
    if i==1
        c_density=density(i);
    else
        c_density(i)=c_density(i-1)+density(i);
    end
end
CumuPixel=uint8(255*c_density+0.5);
%plot(count);
%plot(density);
%plot(c_density);
%plot(CumuPixel);
gray2=gray;
for i=1:300
    for j=1:300
        gray2(i,j)=CumuPixel(gray(i,j)+1);
    end
end
figure,imshow(gray2);
img2=histeq(gray);
% figure,imshow(img2);
figure,imhist(img1);
figure,imhist(gray2);
%figure,imhist(img2);