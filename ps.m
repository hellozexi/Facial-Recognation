%读取灰太狼图片
wolf=imread('C:\Users\Paragon\Desktop\各种作业\facerec\day1\homework3\2.jpg');

%figure,imshow(wolf);
%设置分辨率（压缩图片）
size1=ceil(77);
size2=ceil(70);
img_new1=imresize(wolf,[size1 size2]);

%figure,imshow(img_new1);

%找图片的圆心
center = [ceil(size1/2),ceil(size2/2)];
%以横向长度为半径（Length）
Length = size2/2;
%取平方
LengthSquare = Length^2;

%设置一个自由坐标，遍历整个图片
%取一个圆，圆以外的范围设置为黑色（0,0,0）
for indextmp1=1:size1
    for indextmp2=1:size2
        Point=(indextmp1-center(1))^2+(indextmp2-center(2))^2;
        if Point>=LengthSquare
            %此处括号内分别是（x坐标，y坐标，:的意思是取全部，这里指rgb全选）
            %要知道，每个坐标都是一个像素，每个像素都有rgb三个值
            %也就是一个3维数组（x，y，rgb）
            img_new1(indextmp1,indextmp2,:)=0;
        end
    end
end
%figure,imshow(img_new1);
%读取女孩图片
girl=imread('C:\Users\Paragon\Desktop\各种作业\facerec\day1\homework3\4.jpg');
%图片拉伸
size3=ceil(500);
size4=ceil(500);
img_new2=imresize(girl,[size3 size4]);

%figure,imshow(img_new2);


%取女孩图片的（190,165）为圆心，取一个圆，将
%灰太狼的图片的像素一一对应写入，这样就是把灰太狼图片插入女孩图片了
%取了一个比例，是像素点与圆心距离和半径的比，记为ratio
%将灰太狼图的rgb值和女孩图的rgb值分别乘以ratio和1-ratio，这样就是渐变效果了
%255*ratio是白色透明边框，（rbg=255是纯白）
for indextmp1=1:size1
    for indextmp2=1:size2
        Point=(indextmp1-center(1))^2+(indextmp2-center(2))^2;
        if Point<LengthSquare
            ratio=Point/LengthSquare;
            img_new2(190+indextmp1,165+indextmp2,:)=img_new2(190+indextmp1,165+indextmp2,:)*ratio+img_new1(indextmp1,indextmp2,:)*(1-ratio);
            img_new2(190+indextmp1,165+indextmp2,:)=img_new2(190+indextmp1,165+indextmp2,:)*(1-ratio)+255*ratio;
            
        end
    end
end
figure,imshow(img_new2);
            


