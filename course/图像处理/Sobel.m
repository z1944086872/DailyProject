function [ ] = Sobel( im )
% im=imread('im/Grayblur6.png');
% Sobel(im )
imshow(im);title('ԭʼͼ��');
im=double(im);

H=[-1 0 1;-2 0 2;-1 0 1];
Dy=filter2(H,im);

H=[-1 -2 -1;0 0 0;1 2 1];
Dx=filter2(H,im);

im2=uint8(im+sqrt(Dx.^2+Dy.^2)*0.1);
figure;imshow(im2);title('Sobel�񻯵���ͼ��');

im_L0=uint8(sqrt(Dx.^2+Dy.^2));
figure;imshow(im_L0);title('Sobel��ͼ��');


end

