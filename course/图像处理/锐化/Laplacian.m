function [ ] = Laplacian(im )
% im=imread('im/Grayblur6.png');
% Laplacian(im )
imshow(im);title('ԭʼͼ��');
im0=im;
im=double(im);



H=[0 -1 0; -1 4 -1;0 -1 0];
im1=filter2(H,im);

im2=uint8(im1+im);
figure;imshow(im2);title('Laplacian�񻯵���ͼ��');

im_L0=uint8(im1);
figure;imshow(im_L0);title('Laplacian��ͼ��');

end

