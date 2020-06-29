function [im_filered]=KNNFilter(im_noise,N,K)
[h,l,c]=size(im_noise);
Y=zeros(h,l);
n=floor(N/2);%向下取整得到前后行
im=double(im_noise);
mid=floor((N*N)/2)+1;
for i=n+1:h-n
    for j=n+1:h-n
        block=im(i-n:i+n,j-n:j+n);%找到以i，j为中心的N*N的矩阵
        blockdelt=abs(block-im(i,j));%减去中心求绝对值
        blockdeltline=blockdelt(:);%变成一行
        blockdeltline(mid)=[];%去除中心元素
        [temsort,ind]=sort(blockdeltline);%排序
        block2line=block(:);%变一行
        block2line(mid)=[];%区中心
        KNNS=block2line(ind(1:K));
        Y(i,j)=mean(KNNS);%求均值
    end
end

Y=floor(Y);

im_filered=uint8(Y);
figure,imshow(im_filered),title('KNNS图象'); 


end

