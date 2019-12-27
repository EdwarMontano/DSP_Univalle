clc; clearvars; close all;

T= 0.10; D= exp(-0.1*T )* cos(3*T);
%Polinomio Numerador
b0= 1 ; b1=-D;  b2=0;
b= [b0  b1  b2];
%Polinomio Denominador
a0=1;  a1=-2*D*cos(3*T);  a2=exp(-0.2*T);
a=[a0  a1  a2];
%Polos
polos=roots(a)
AngPolos=angle(polos)*180/pi
MagPolos=abs(polos)
%freqz(b,a)
fvtool(b,a)