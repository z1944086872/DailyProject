function [ ] = Laplacian(im )
% im=imread('im/Grayblur6.png');
% Laplacian(im )
imshow(im);title('原始图像');
im0=im;
im=double(im);



H=[0 -1 0; -1 4 -1;0 -1 0];
im1=filter2(H,im);

im2=uint8(im1+im);
figure;imshow(im2);title('Laplacian锐化叠加图像');

im_L0=uint8(im1);
figure;imshow(im_L0);title('Laplacian锐化图像');

end

