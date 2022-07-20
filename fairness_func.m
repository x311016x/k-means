clc;clear all;
A=[1,2,3,4,5,4,3,2,1];
B=[3,3,3,3,3,3,3,3,3];
sum=0;
sum2=0;
for i=1:9
sum=B(i)^2+sum;
sum2=B(i)+sum2;
end
sum2=sum2^2;
sum=sum*9;
sum2/sum;

