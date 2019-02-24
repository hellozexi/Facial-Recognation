function[f_matrix,rclass]=readface(npersons,bool)
rclass=zeros(npersons*5,1);%建立空矩阵%
f_matrix=zeros(npersons*5,112*92);%建立空矩阵%
for i=1:npersons  
    facepath='.\orl_faces\s';  
    facepath=strcat(facepath,num2str(i));  
    facepath=strcat(facepath,'\');  
    cachepath=facepath;  
    for j=1:5  
        facepath=cachepath;  
        if bool==0 %读入训练样本图像的数据  
            facepath=strcat(facepath,'0'+j);  
            rclass((i-1)*5+j)=i;%构造答案矩阵%
        else %读入测试样本数据  
            facepath=strcat(facepath,num2str(5+j));  
            rclass((i-1)*5+j)=i;%构造答案矩阵%
        end  
        facepath=strcat(facepath,'.pgm');  
        img=imread(facepath);  
        f_matrix((i-1)*5+j,:)=img(:)';%建立人脸数据矩阵%
    end  
end  
end  