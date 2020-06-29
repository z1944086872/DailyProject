function [im_filered]=KNNFilter(im_noise,N,K)
[h,l,c]=size(im_noise);
Y=zeros(h,l);
n=floor(N/2);%����ȡ���õ�ǰ����
im=double(im_noise);
mid=floor((N*N)/2)+1;
for i=n+1:h-n
    for j=n+1:h-n
        block=im(i-n:i+n,j-n:j+n);%�ҵ���i��jΪ���ĵ�N*N�ľ���
        blockdelt=abs(block-im(i,j));%��ȥ���������ֵ
        blockdeltline=blockdelt(:);%���һ��
        blockdeltline(mid)=[];%ȥ������Ԫ��
        [temsort,ind]=sort(blockdeltline);%����
        block2line=block(:);%��һ��
        block2line(mid)=[];%������
        KNNS=block2line(ind(1:K));
        Y(i,j)=mean(KNNS);%���ֵ
    end
end

Y=floor(Y);

im_filered=uint8(Y);
figure,imshow(im_filered),title('KNNSͼ��'); 


end

