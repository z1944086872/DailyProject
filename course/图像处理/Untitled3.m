function [ output_args ] = Untitled3( impath,n )
%[ output_args ] = Untitled3( 'im\cameraman.tif',3);
I=imread(impath);
J=imnoise(I,'salt & pepper');
figure,imshow(J),title('����ͼ��'); 
G=imnoise(I,'gaussian');
figure,imshow(G),title('��˹ͼ��'); 
ft=ones(n,n)/(n*n);
K1=medfilt2(J);
figure,imshow(K1),title('���ξ�ֵͼ��'); 
K2=medfilt2(G);
figure,imshow(K2),title('��˹��ֵͼ��'); 
F1=uint8(filter2(ft,J));
figure,imshow(F1),title('������ֵͼ��'); 
F2=uint8(filter2(ft,G));
figure,imshow(F2),title('��˹��ֵͼ��'); 



end

