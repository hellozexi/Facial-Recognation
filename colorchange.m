x=imread('C:\Users\Paragon\Desktop\56697596_p0.jpg');
figure,imshow(x);
x1=double(x);
%Y2=(x1(:,:,1)+x1(:,:,2)+x1(:,:,3))/3;
Y2=0.299*x1(:,:,1)+0.587*x1(:,:,2)+0.114*x1(:,:,3);
Y2=round(Y2);
figure,imshow(uint8(Y2));