clear all
clc

x=[1:1:10];
y=2*x;
y2=x.^2;




subplot(2,2,1)
plot(x,y)
subplot(2,2,2)
plot(x,y)
subplot(2,2,3:4)
plot(x,y2)
