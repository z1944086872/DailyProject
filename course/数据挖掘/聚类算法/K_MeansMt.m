function [u clusterID]=K_MeansMt(data,K)
% ʵ��4  �����㷨
% һ��ʵ��Ŀ��
% ��1���������㷨�Ļ���ԭ��
% ��2������kmeans�����㷨��ԭ����ʵ�֡�
% 
% 
% ����ʵ������
% 1�����ݼ�data.mat�����ʵ��K means�㷨����K_MeansMt����д����ϸע�͡�
% ���Դ������£�
% load 'data.mat';
% [u re]=K_MeansMt(data,3);  %�������ر�� re 
% [m n]=size(re);
% %�����ʾ����������
% figure;
% hold on;
% for i=1:m 
%     if re(i)==1   
%          plot(data(i,1),data(i,2),'ro'); 
%     elseif re(i)==2
%          plot(data(i,1),data(i,2),'go'); 
%     else 
%          plot(data(i,1),data(i,2),'bo'); 
%     end
% end
% grid on;
% ����ִ����ȷ��roc_plot��������ճ���ڴ˴������Ĵ���Ҫ����ע�ͣ�
% 
% 
% 
% ��ҵ�ύ����Ҫ�󽫼����𰸺ʹ���ճ�������ĵ��Ķ�Ӧλ�ã��������ĵ�������Ϊ��ѧ��+����+4.doc���ύ��FTP��Ӧ�ļ����С� 

[m n]=size(data);
ma=zeros(1,n);
mi=zeros(1,n);
u=zeros(K,n);
%�����ʼ����������ʼ����
for i=1:n
    ma(i)=max(data(:,i));
    mi(i)=min(data(:,i));
    for j=1:K
        u(j,i)=mi(i)+(ma(i)-mi(i))*rand();
    end
end
%ѭ��
while 1
    %������㵽�������ĵľ���ֻ��
    pre_u=u;
    coordinate_difference{m,K}=[];
    for i=1:m
        for j=1:K
            coordinate_difference{i,j}=data(i,:)-u(j,:);
        end
    end
    Dist=ones(m,K)*-1;
    for i=1:m
        c=zeros(1,K);
        for j=1:K
            c(j)=norm(coordinate_difference{i,j});%����㵽���ĵľ���
        end
        [cmin index]=min(c);%�ҳ��õ㵽�������ľ��������õ�
        Dist(i,index)=norm(coordinate_difference{i,index});%�������ֵ
    end
    for i=1:K
        ind=find(Dist(:,i)>=0);
        u(i,:)=mean(data(ind,:))%��ƽ��
    end
    if norm(pre_u-u)<0.1
        break;
    end
end
clusterID=[];
for i=1:m
    dist=[];
    for j=1:K
        dist=[dist norm(data(i,:)-u(j,:))];
       
    end
    [x index] = min(dist);
    clusterID=[clusterID;index];
end
        

    
    



end

