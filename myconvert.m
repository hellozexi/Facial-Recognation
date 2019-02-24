dir='G:\Matlab Projects\ÈËÁ³Ê¶±ðself\orl_faces\jxt';
for j=1:10
        path=[dir,'\',num2str(j),'.jpg'];
        img1=imread(path);
        img1=rgb2gray(img1);
        size1=ceil(112);
        size2=ceil(92);
        img2=imresize(img1,[size1 size2]);
        FileName=strcat(dir,'\',num2str(j),'.pgm');
        imwrite(img2,FileName,'PGM');
        %figure,imshow(img2);
end