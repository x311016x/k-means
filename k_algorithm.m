function [cc,C]=k_algorithm(P,DataP)
%cc
n=size(P,1);
x=DataP(:,1);
y=DataP(:,2);
for i=1:n
cc{i}=P{i};
end
d_sum=10;
count=0;
while(1)
        %% Set setting
    D=zeros(n,1);
    C = cell(n,1);%C={c1;c2;c3}; 各個子集
    for i=1:size(x)
    for j=1:n
        temp=[x(i),y(i)];
        D(j)=(distant(cc{j},temp));
    end
    idx=find(D==min(D));
    p=[x(i),y(i)];
    C{min(idx)}=[C{min(idx)} ;p];
    end
    if(d_sum<0.5)
        break;
    else
        d_sum=0;
    end
        %% Caculate center
    for i=1:n
        if ((~isempty(C{i})))
             x_c=sum(C{i}(:,1))/length(C{i});
             y_c=sum(C{i}(:,2))/length(C{i});
             temp=[x_c,y_c];
             d_sum=d_sum+distant(temp,cc{i});
             cc{i}=temp;          
        end
    end  
    count=count+1
     d_sum
end
end