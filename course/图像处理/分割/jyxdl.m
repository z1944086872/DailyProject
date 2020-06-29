function [Im2,BestThrd]=jyxdl(Im)

bestDelta=Inf;%差值为无穷
BestThrd=0;%最好的阈值
[m n]=size(Im);

%求出最好的阈值
for Thrd=0:255
    ind1=find(Im<=Thrd);%小于阈值
    ind2=find(Im>Thrd);%大于阈值
    if(~isempty(ind1)&&~isempty(ind2))
        mu1=mean(Im(ind1));%均值
        mu2=mean(Im(ind2));
        ma1=sum((Im(ind1)-mu1).^2);%求方差
        ma2=sum((Im(ind2)-mu2).^2);
        p1=length(ind1)/(m*n);%求比例
        p2=length(ind2)/(m*n);
        Delta=p1*ma1+p2*ma2;%求最终的差
        if(Delta<bestDelta)%如果差值小于最好差值则替换
            BestThrd=Thrd;
            bestDelta=Delta;
            disp(BestThrd);
        end
    end
end
Im2=zeros(m,n);
Im2(find(Im>BestThrd))=1;%大于做前景小于做背景
Im2=logical(Im2);







end

