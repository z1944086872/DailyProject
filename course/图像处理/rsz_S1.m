function [im]= rsz_S1 (I,Kr,Kc)
[M,N,K]=size(I);
M2=round(M*Kr);
N2=round(N*Kc);
im=zeros(M2,N2,K);
for i=1:M2
    for j=1:N2
        x=round(i/Kr);
        y=round(j/Kc);
        if x>M
            x=M;
        end
        if x<1
            x=1;
        end
        if y>N
            y=N;
        end
        if y<1
            y=1;
        end
        im(i,j,:)=I(x,y,:);
    end
end
im=uint8(im);


end

