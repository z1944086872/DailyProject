function [ ] = Roberts( Im0 )
% im=imread('im/Grayblur6.png');
% Roberts(im )
[m0,n0,c]=size(Im0);
if c==3
    Im0=rgb2gray(Im0);
end
Im=zeros(m0,n0);

for i=1:m0
    for j=1:n0
        Im(i,j)=abs(Im0(i+1,j+1)-Im0(i,j))+abs(Im0(i+1,j)-Im0(i,j+1));
    end
end
im2=uint8(Im0+Im);
figure;imshow(im2);title('RobertsÈñ»¯µþ¼ÓÍ¼Ïñ');

im_L0=uint8(Im);
figure;imshow(im_L0);title('RobertsÈñ»¯Í¼Ïñ');   


end



