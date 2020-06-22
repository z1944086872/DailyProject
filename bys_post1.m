function [post4all]=bys_post1(trAttr, trLabels,tstAttr);
[params,prior,AllLabels] = NaiveBayesTrain(trAttr, trLabels);
num1=size(tstAttr,1);
type=ones(num1,1);
for i=1:num1
    tstSample=tstAttr(i,:);
    post = NaiveBayesPredict(type,params,prior,tstSample);
    post4all(i,:)=post./sum(post);
end




end

