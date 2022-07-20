clc;clear all;
%% parameter
q=zeros(200);
u=[150,150;50,50];
sigma=[10,10;20,20];
%% Map Generation
Map=Map_generation(q,u,sigma);
Map=Map*0.9;
xx=0:199;
yy=xx';
figure(1)
s=pcolor(xx,yy,Map);
s.LineStyle = "none";
%s.FaceColor = 'interp';
colormap gray
xlim([0 200]);
ylim([0 200]);
%
figure(3)
[X,Y] = meshgrid(1:200);
mesh(X,Y,Map);
%% MAP TO DATA POINT
DATA_P=Map_to_dataPoint(Map,100);
figure(2)
plot(DATA_P(:,1),DATA_P(:,2),'.','Color','k');
xlim([0 200]);
ylim([0 200]);




