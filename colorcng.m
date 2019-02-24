%读取路径
Strinput='C:\Users\Paragon\Desktop\各种作业\facerec\day1\homework1\faces';
StrOut='C:\Users\Paragon\Desktop\各种作业\facerec\day1\homework1\gray';
%读取faces里的所有jpg
Files=dir(strcat(Strinput,'*.jpg'));
%测文件数量
LengthFiles=length(Files);
for i = 1:LengthFiles
    %依次读取图片
    ImgInput=imread(strcat(Strinput,Files(i).name));
    x1=double(ImgInput);
    %黑白化，即分别给rgb乘以0.299,0.587,0.114,此为matlab预设的权值
    Y2=0.299*x1(:,:,1)+0.587*x1(:,:,2)+0.114*x1(:,:,3);
    %取整
    Y2=round(Y2);
    %黑白图片输出，强制uint8，意为8位无符号数（0-255）
    ImgOutput=uint8(Y2);
    %循环将文件名改为BMP格式
    %减最后三位，加上BMP
    FileName=strcat(StrOut,Files(i).name(1:length(Files(i).name)-3));
    FileName=strcat(FileName,'BMP');
    %创建图片文件
    imwrite(ImgOutput,FileName,'BMP');
end