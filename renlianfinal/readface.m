function[f_matrix,rclass]=readface(npersons,bool)
rclass=zeros(npersons*5,1);%�����վ���%
f_matrix=zeros(npersons*5,112*92);%�����վ���%
for i=1:npersons  
    facepath='.\orl_faces\s';  
    facepath=strcat(facepath,num2str(i));  
    facepath=strcat(facepath,'\');  
    cachepath=facepath;  
    for j=1:5  
        facepath=cachepath;  
        if bool==0 %����ѵ������ͼ�������  
            facepath=strcat(facepath,'0'+j);  
            rclass((i-1)*5+j)=i;%����𰸾���%
        else %���������������  
            facepath=strcat(facepath,num2str(5+j));  
            rclass((i-1)*5+j)=i;%����𰸾���%
        end  
        facepath=strcat(facepath,'.pgm');  
        img=imread(facepath);  
        f_matrix((i-1)*5+j,:)=img(:)';%�����������ݾ���%
    end  
end  
end  