function[f_matrix,rclass]=readmyface(m,n)%��ȡ��m���˵ĵ�n����Ƭ%
rclass=zeros(1,1);%�����𰸾��󣬵�������1,1����%
f_matrix=zeros(1,112*92); %�������ݾ���%   
facepath='.\orl_faces\s';  
facepath=strcat(facepath,num2str(m));  
facepath=strcat(facepath,'\');%ƴ��·��'orl_faces\sm\'%
rclass(1,1)=m;%���ô�%     
facepath=strcat(facepath,num2str(n));
facepath=strcat(facepath,'.pgm');%'orl_faces\sm\n.pgm'%
img=imread(facepath);%��ȡͼƬ%
f_matrix(1,:)=img(:)';%תΪ���о���%
end   