function [cc,C]=k_algorithm(P,DataP)
%cc
n=size(P,1);
x=DataP(:,1);
y=DataP(:,2);
for i=1:n
cc{i}=P{i};
end
d_sum=10;
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
    C{min(idx)}{end+1}=p;
    end
    if(d_sum<0.1)
        break;
    else
        d_sum=0;
    end
        %% Caculate center
    for i=1:n
     x_c=0;
     y_c=0;
    for j=1:length(C{i})
          temp=C{i}{j};
          x_c=x_c+temp(1);
          y_c=y_c+temp(2);
    end
    temp=[x_c/length(C{i}),y_c/length(C{i})];
    d_sum=d_sum+distant(temp,cc{i});
    cc{i}=temp;
    end  
end
end