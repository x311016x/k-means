function DataP=Map_to_dataPoint(Map,Threshold)
%check 矩陣總和，是否需要切割
%    L3  L4
%L1 [A   B;
%L2  C   D]
if (sum(sum(Map))>Threshold)&size(Map,1)>2
    new_L1=fix(length(Map(:,1))/2);
    new_L2=length(Map(:,1))-new_L1;
    new_L3=fix(length(Map(1,:))/2);
    new_L4=length(Map(1,:))-new_L3;
    subMap=mat2cell(Map,[new_L1  new_L2],[ new_L3  new_L4]);
    
   DataPA =Map_to_dataPoint(subMap{1},Threshold);
   DataPB=Map_to_dataPoint(subMap{2},Threshold);
   DataPC=Map_to_dataPoint(subMap{3},Threshold);
   DataPD=Map_to_dataPoint(subMap{4},Threshold);
   
   DataPA(:,1)=DataPA(:,1)+0;
   DataPA(:,2)=DataPA(:,2)+0;
   DataPB(:,1)=DataPB(:,1)+0;
   DataPB(:,2)=DataPB(:,2)+new_L1;
   DataPC(:,1)=DataPC(:,1)+new_L3;
   DataPC(:,2)=DataPC(:,2)+0;
   DataPD(:,1)=DataPD(:,1)+new_L3;
   DataPD(:,2)=DataPD(:,2)+new_L1;
 
   DataP=[DataPA;DataPB;DataPC;DataPD];
else 
    %idx=find(Map==max(max(Map)));
    %DataP=[mod(idx,length(Map(:,1))),fix(idx/length(Map(:,1)))+1];
    x=fix(length(Map(:,1))/2)+1;
    y=fix(length(Map(1,:))/2)+1;
    DataP=[x,y];
end
end