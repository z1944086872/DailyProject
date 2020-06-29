function [ output_args ] = Untitled3( impath,n )
%[ output_args ] = Untitled3( 'im\cameraman.tif',3);
I=imread(impath);
J=imnoise(I,'salt & pepper');
figure,imshow(J),title('椒盐图象'); 
G=imnoise(I,'gaussian');
figure,imshow(G),title('高斯图象'); 
ft=ones(n,n)/(n*n);
K1=medfilt2(J);
figure,imshow(K1),title('椒盐均值图象'); 
K2=medfilt2(G);
figure,imshow(K2),title('高斯均值图象'); 
F1=uint8(filter2(ft,J));
figure,imshow(F1),title('椒盐中值图象'); 
F2=uint8(filter2(ft,G));
figure,imshow(F2),title('高斯中值图象'); 



end

