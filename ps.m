%��ȡ��̫��ͼƬ
wolf=imread('C:\Users\Paragon\Desktop\������ҵ\facerec\day1\homework3\2.jpg');

%figure,imshow(wolf);
%���÷ֱ��ʣ�ѹ��ͼƬ��
size1=ceil(77);
size2=ceil(70);
img_new1=imresize(wolf,[size1 size2]);

%figure,imshow(img_new1);

%��ͼƬ��Բ��
center = [ceil(size1/2),ceil(size2/2)];
%�Ժ��򳤶�Ϊ�뾶��Length��
Length = size2/2;
%ȡƽ��
LengthSquare = Length^2;

%����һ���������꣬��������ͼƬ
%ȡһ��Բ��Բ����ķ�Χ����Ϊ��ɫ��0,0,0��
for indextmp1=1:size1
    for indextmp2=1:size2
        Point=(indextmp1-center(1))^2+(indextmp2-center(2))^2;
        if Point>=LengthSquare
            %�˴������ڷֱ��ǣ�x���꣬y���꣬:����˼��ȡȫ��������ָrgbȫѡ��
            %Ҫ֪����ÿ�����궼��һ�����أ�ÿ�����ض���rgb����ֵ
            %Ҳ����һ��3ά���飨x��y��rgb��
            img_new1(indextmp1,indextmp2,:)=0;
        end
    end
end
%figure,imshow(img_new1);
%��ȡŮ��ͼƬ
girl=imread('C:\Users\Paragon\Desktop\������ҵ\facerec\day1\homework3\4.jpg');
%ͼƬ����
size3=ceil(500);
size4=ceil(500);
img_new2=imresize(girl,[size3 size4]);

%figure,imshow(img_new2);


%ȡŮ��ͼƬ�ģ�190,165��ΪԲ�ģ�ȡһ��Բ����
%��̫�ǵ�ͼƬ������һһ��Ӧд�룬�������ǰѻ�̫��ͼƬ����Ů��ͼƬ��
%ȡ��һ�������������ص���Բ�ľ���Ͱ뾶�ıȣ���Ϊratio
%����̫��ͼ��rgbֵ��Ů��ͼ��rgbֵ�ֱ����ratio��1-ratio���������ǽ���Ч����
%255*ratio�ǰ�ɫ͸���߿򣬣�rbg=255�Ǵ��ף�
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
            


