function[f_matrix,rclass]=readmyface(m,n)%读取第m个人的第n张照片%
rclass=zeros(1,1);%建立答案矩阵，单人所以1,1矩阵%
f_matrix=zeros(1,112*92); %建立数据矩阵%   
facepath='.\orl_faces\s';  
facepath=strcat(facepath,num2str(m));  
facepath=strcat(facepath,'\');%拼凑路径'orl_faces\sm\'%
rclass(1,1)=m;%设置答案%     
facepath=strcat(facepath,num2str(n));
facepath=strcat(facepath,'.pgm');%'orl_faces\sm\n.pgm'%
img=imread(facepath);%读取图片%
f_matrix(1,:)=img(:)';%转为单行矩阵%
end   