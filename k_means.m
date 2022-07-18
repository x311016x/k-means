clc;clear all;close all;
%% param
q=zeros(240,240);
p1=[60,60];
p2=[180,60];
p3=[120,180];
p4=[30,120];
p5=[210,120];
P={p1;p2;p3;p4;p5};
mycolor=['r','g','b','y','c','m'];
n=size(P,1);
%% data point generation
for i=1:size(q,1)
    for j=1:size(q,2)
        if rand>0.998
            q(i,j)=1;
        end  
    end
end
[x,y]=find(q);
DataP=[x,y];
%% initial graph
figure
hold on
for i=1:n
    temp=P{i};
    plot(temp(1),temp(2),'o','Color',mycolor(i));
end

%% k-algorithm
 [cc,C]=k_algorithm(P,DataP);
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













