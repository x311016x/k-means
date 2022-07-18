clc;clear all;
%% parameter
q=zeros(200);
u=[100,100;50,50];
sigma=[10,10;5,5];
%% Map Generation
Map=Map_generation(q,u,sigma);
xx=0:199;
yy=xx';
colormap parula
figure(1)
s=pcolor(xx,yy,Map);
s.LineStyle = "none";
%s.FaceColor = 'interp';
xlim([0 199]);
ylim([0 199]);
DATA_P=Map_to_dataPoint(Map,10*100);
%% MAP TO DATA POINT
figure(2)
plot(DATA_P(:,1),DATA_P(:,2),'*','Color','k');
xlim([0 199]);
ylim([0 199]);




