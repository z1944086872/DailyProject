function [ ] = Roberts( Im0 )
% im=imread('im/Grayblur6.png');
% Roberts(im )
[m0,n0,c]=size(Im0);
imshow(Im0);title('Ô­Ê¼Í¼Ïñ');
if c==3
    Im0=rgb2gray(Im0);
end
Im=zeros(m0,n0);
Im0=double(Im0);

for i=2:m0-1
    for j=2:n0-1
        Im(i,j)=abs(Im0(i+1,j+1)-Im0(i,j))+abs(Im0(i+1,j)-Im0(i,j+1));
    end
end
im2=uint8(Im0+Im);
figure;imshow(im2);title('RobertsÈñ»¯µþ¼ÓÍ¼Ïñ');

im_L0=uint8(Im);
figure;imshow(im_L0);title('RobertsÈñ»¯Í¼Ïñ');   


end



