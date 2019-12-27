clc;clear all; close all;

T= 0.01;

T2=(T^2);
D=(1+0.2*T+9.01*T2);

%Polinomio Numerador
b0= T2/D ; b1=0;  b2=0;
b= [b0  b1  b2];
%Polinomio Denominador
a0=1;  a1=-2*(1+0.1*T)/D;  a2=1/D;
a=[a0  a1  a2];

polos=roots(a)
AngPolos=angle(polos)*180/pi
MagPolos=abs(polos)
%freqz(b,a)
fvtool(b,a)