function [im]=mirror_horizontal(I);
[M,N,C]=size(I);%�õ���С
im=zeros(M,N,C);%newһ������
for i=1:M
    for j=1:N
        im(i,N-j+1,:)=I(i,j,:);%ˮƽ����
    end
end
im=uint8(im);%һ��Ҫ��


end

