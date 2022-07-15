clc;clear all;close all;
%% param
q=zeros(240,240);
times=10;
p1=[60,60];
p2=[180,60];
p3=[120,180];
P={p1;p2;p3};
mycolor=['r','g','b','y','c','m'];
cc=cell(1,times);%(1,k)
n=size(P(:,1),1);
for i=1:n
cc{1}{i}=P{i};
end
C = cell(3,1);%C={c1;c2;c3}; 各個子集

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

for k=1:times
        %% Set setting
    D=zeros(n,1);
    for i=1:size(x)
    for j=1:n
        temp=[x(i),y(i)];
        D(j)=(distant(cc{k}{j},temp))^2;
    end
    idx=find(D==min(D));
    p=[x(i),y(i)];
    C{min(idx)}{end+1}=p;
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
    cc{k+1}{i}=temp;
    end
    cc{k+1}

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
for time=1:size(cc,2)
      for i=1:n
           temp=cc{time}{i};
           if (time==1)||(time==times)
               marker='O';
           else
               marker='x';
           end
               plot(temp(1),temp(2),marker,'Color',mycolor(i));
               hold on
      end
end
%劃分界線

%% function 
function d = distant(p1,p2)
  x=p1(1)-p2(1);
  y=p1(2)-p2(2);
  d=sqrt(x^2+y^2);
end

function eq=boundary(p1,p2,p0) %y=ax+b eq(1)=a eq(2)=b
x=p1(1)-p2(1);
y=p1(2)-p2(2);
m=x/y;
%y-y0=m(x-x0)
%y=mx+(y0-m*x0)
eq(1)=a;
eq(2)=b;
end