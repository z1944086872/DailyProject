function [Im2]=pParam0(Im,perct)

bestDelta=Inf;%差值为无穷
BestThrd=0;%最好的阈值
[m n]=size(Im);

%求出最好的阈值
for Thrd=0:255
    ind1=find(Im<=Thrd);%小于阈值
    ind2=find(Im>Thrd);%大于阈值
    if(~isempty(ind1)&&~isempty(ind2))
        p1=length(ind1)/(m*n);%背景所占的比列
        p2=length(ind2)/(m*n);%前景所占比列
        Delta=abs(p2-perct);
        if(Delta<bestDelta)%如果差值小于最好差值则替换
            BestThrd=Thrd;
            bestDelta=Delta;
        end
    end
end
Im2=zeros(m,n);
Im2(find(Im>BestThrd))=1;%大于做前景小于做背景
Im2=logical(Im2);




end

