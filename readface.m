function[f_matrix]=readface(inputpath)
dir=inputpath;
f_matrix=[];
for i=1:41
    for j=1:10
        path=[dir,'\s',num2str(i),'\',num2str(j),'.pgm'];
        tmp_img1=imread(path);
        tmp_img2=tmp_img1(:)';
        %tmp_img2=reshape(tmp_img1',[1,112*92]);
        f_matrix=[f_matrix;tmp_img2];
    end
end
%ÔÙ´ÎÈ¡Í¼Ïñ
% img=[];
% img=f_matrix(1,:);
% img=reshape(img,[112,92]);
% figure,imshow(img);

end