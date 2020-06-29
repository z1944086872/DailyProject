function [im]=aff(I,A) 
[M,N,K]=size(I);%ԭͼ��С
InvA=inv(A);%����A�������
x1=1; x2=M;x3=M;x4=1;%��������
y1=1;y2=1;y3=N;y4=N;
x=[x1,x2,x3,x4];
y=[y1,y2,y3,y4];
rst=A*[x;y;ones(1,4)];%�õ��ĸ��߽�����
rst=round(rst);
xmin=min(rst(1,:));%����߽������Сֵ
xmax=max(rst(1,:));
ymin=min(rst(2,:));
ymax=max(rst(2,:));
%����ƽһ��
if xmin<=0
    delx=abs(xmin)+1;
else
    delx=0
end
if ymin<=0
    dely=abs(ymin)+1;
else
    dely=0;
end

M2=xmax-xmin+1;%������ͼ������С
N2=ymax-ymin+1;
im=ones(M2,N2,K);
for i=1:M2
    for j=1:N2
        rst=InvA*[i-delx ;j-dely;1];%������ͼ����ĵ�ԭͼ����
        x=round(rst(1,1));y=round(rst(2,1));%ȡ����
        if(x>0&&x<=M&&y>0&&y<=N)
            im(i,j,:)=I(x,y,:);
        end
    end
end
im=uint8(im);
        



end

