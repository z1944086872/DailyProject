function [im_filered]=SNNFilter(im_noise,n)
[h,l,c]=size(im_noise);
Y=zeros(h,l);
for i=n+1:h-n
    for j=n+1:l-n
        temp=[];
        for r=i-n:i+n
            for c=j-n:j+n
                a0=double(im_noise(i,j));%区中心点
                a1=double(im_noise(r,c));%取当前点
                a2=double(im_noise(2*i-r,2*j-c));%取对称点
                if(abs(a1-a0)>abs(a2-a0))%取更近对称点
                    select_a=a2;
                else
                    select_a=a1;
                end
                if~(r==i&&c==j)
                    temp=[temp,select_a];
                end
            end
        end
        Y(i,j)=mean(temp);
    end
end
im_filered=uint8(Y);

end

