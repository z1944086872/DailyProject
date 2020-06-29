function [im]=aff(I,A) 
[M,N,K]=size(I);%原图大小
InvA=inv(A);%计算A的逆矩阵
x1=1; x2=M;x3=M;x4=1;%上右下左
y1=1;y2=1;y3=N;y4=N;
x=[x1,x2,x3,x4];
y=[y1,y2,y3,y4];
rst=A*[x;y;ones(1,4)];%得到四个边界坐标
rst=round(rst);
xmin=min(rst(1,:));%计算边界最大最小值
xmax=max(rst(1,:));
ymin=min(rst(2,:));
ymax=max(rst(2,:));
%计算平一辆
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

M2=xmax-xmin+1;%计算新图画布大小
N2=ymax-ymin+1;
im=ones(M2,N2,K);
for i=1:M2
    for j=1:N2
        rst=InvA*[i-delx ;j-dely;1];%根据新图坐标的到原图坐标
        x=round(rst(1,1));y=round(rst(2,1));%取整数
        if(x>0&&x<=M&&y>0&&y<=N)
            im(i,j,:)=I(x,y,:);
        end
    end
end
im=uint8(im);
        



end

