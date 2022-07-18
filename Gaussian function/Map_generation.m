function Map=Map_generation(q,u,sigma)
%% parameter
%q=zeros(200);
%u=[100,100];
%sigma=[3,10];
%% Map
size(u,1)
for i=1:size(u,1)
    for x=1:200
        for y=1:200
            d=sqrt(((x-u(i,1))^2)/sigma(i,1)^2+((y-u(i,2))^2)/sigma(i,2)^2);
            q(x,y)=q(x,y)+exp(-d);
        end
    end
end
Map=q*100;
end