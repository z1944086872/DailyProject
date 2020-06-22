function [u clusterID]=K_MeansMt(data,K)
% 实验4  聚类算法
% 一、实验目的
% （1）理解聚类算法的基本原理。
% （2）掌握kmeans聚类算法的原理与实现。
% 
% 
% 二、实验内容
% 1、数据见data.mat，编程实现K means算法代码K_MeansMt，并写出详细注释。
% 测试代码如下：
% load 'data.mat';
% [u re]=K_MeansMt(data,3);  %最后产生簇标号 re 
% [m n]=size(re);
% %最后显示聚类后的数据
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
% （将执行正确的roc_plot函数代码粘贴在此处，核心代码要求有注释）
% 
% 
% 
% 作业提交：按要求将简答题答案和代码粘贴至本文档的对应位置，并将本文档重命名为“学号+姓名+4.doc”提交到FTP对应文件夹中。 

[m n]=size(data);
ma=zeros(1,n);
mi=zeros(1,n);
u=zeros(K,n);
%随机初始化出三个初始质心
for i=1:n
    ma(i)=max(data(:,i));
    mi(i)=min(data(:,i));
    for j=1:K
        u(j,i)=mi(i)+(ma(i)-mi(i))*rand();
    end
end
%循环
while 1
    %求出个点到三个质心的距离只差
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
            c(j)=norm(coordinate_difference{i,j});%求各点到质心的距离
        end
        [cmin index]=min(c);%找出该点到三个质心距离最近打得点
        Dist(i,index)=norm(coordinate_difference{i,index});%计算距离值
    end
    for i=1:K
        ind=find(Dist(:,i)>=0);
        u(i,:)=mean(data(ind,:))%求平均
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

