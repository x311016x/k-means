clc;clear all;close all;
%% param
q=zeros(240,240);
p1=[60,60];
p2=[180,60];
p3=[120,180];
P={p1;p2;p3};
mycolor=['r','g','b','y','c','m'];
n=size(P(:,1),1);
cc={n,1};


for i=1:n
cc{i}=P{i};
end
%% data point generation
for i=1:size(q,1)
    for j=1:size(q,2)
        if rand>0.998
            q(i,j)=1;
        end  
    end
end
[x,y]=find(q);
%% initial graph
figure
hold on
for i=1:n
    temp=P{i};
    plot(temp(1),temp(2),'o','Color',mycolor(i));
end


count=0;
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
    d_sum
    count=count+1
end


%% show graph
axis([0 240 0 240])
%畫各組點
for i=1:n
    for j=1:length(C{i})
        temp=C{i}{j};
        plot(temp(1),temp(2),'*','Color',mycolor(i));
        hold on
     end
end
%畫各組中心
 for i=1:n
     temp=cc{i};
     plot(temp(1),temp(2),'^','Color',mycolor(i));
     hold on       
 end

%劃分界線
px=1:n;
py=1:n;
for i=1:n
   temp=cc{i};
   px(i)=temp(1);
   py(i)=temp(2);
end
voronoi(px,py);



%% function 
function d = distant(p1,p2)
  x=p1(1)-p2(1);
  y=p1(2)-p2(2);
  d=sqrt(x^2+y^2);
end









