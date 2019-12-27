clc;clear all; close all;

%Polinomio Numerador
b0= 0.245 ; b1=b0;
b= [b0  b1];
%Polinomio Denominador
a0=1;  a1=-0.509;
a=[a0  a1];
%Polos
polos=roots(a)
AngPolos=angle(polos)*180/pi
MagPolos=abs(polos)
%freqz(b,a)
fvtool(b,a)