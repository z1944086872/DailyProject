function [im]=mirror_horizontal(I);
[M,N,C]=size(I);%得到大小
im=zeros(M,N,C);%new一个新如
for i=1:M
    for j=1:N
        im(i,N-j+1,:)=I(i,j,:);%水平镜像
    end
end
im=uint8(im);%一定要变


end

