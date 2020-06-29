function [Im2,BestThrd]=jyxdl(Im)

bestDelta=Inf;%��ֵΪ����
BestThrd=0;%��õ���ֵ
[m n]=size(Im);

%�����õ���ֵ
for Thrd=0:255
    ind1=find(Im<=Thrd);%С����ֵ
    ind2=find(Im>Thrd);%������ֵ
    if(~isempty(ind1)&&~isempty(ind2))
        mu1=mean(Im(ind1));%��ֵ
        mu2=mean(Im(ind2));
        ma1=sum((Im(ind1)-mu1).^2);%�󷽲�
        ma2=sum((Im(ind2)-mu2).^2);
        p1=length(ind1)/(m*n);%�����
        p2=length(ind2)/(m*n);
        Delta=p1*ma1+p2*ma2;%�����յĲ�
        if(Delta<bestDelta)%�����ֵС����ò�ֵ���滻
            BestThrd=Thrd;
            bestDelta=Delta;
            disp(BestThrd);
        end
    end
end
Im2=zeros(m,n);
Im2(find(Im>BestThrd))=1;%������ǰ��С��������
Im2=logical(Im2);







end

