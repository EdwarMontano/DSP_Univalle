clc;clear all; close all;


num1= 0.3621*[1 0 -1 ];
den1= [1 -0.782 0.545];

num2= 0.3621*[1 0 -1];
den2= [1 0.3 0.5];

num=conv(num1, num2);
den=conv(den1, den2);

h=impz(num,den); stem([0:length(h)-1],h);

fvtool(num,den)