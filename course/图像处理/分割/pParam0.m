function [Im2]=pParam0(Im,perct)

bestDelta=Inf;%��ֵΪ����
BestThrd=0;%��õ���ֵ
[m n]=size(Im);

%�����õ���ֵ
for Thrd=0:255
    ind1=find(Im<=Thrd);%С����ֵ
    ind2=find(Im>Thrd);%������ֵ
    if(~isempty(ind1)&&~isempty(ind2))
        p1=length(ind1)/(m*n);%������ռ�ı���
        p2=length(ind2)/(m*n);%ǰ����ռ����
        Delta=abs(p2-perct);
        if(Delta<bestDelta)%�����ֵС����ò�ֵ���滻
            BestThrd=Thrd;
            bestDelta=Delta;
        end
    end
end
Im2=zeros(m,n);
Im2(find(Im>BestThrd))=1;%������ǰ��С��������
Im2=logical(Im2);




end

