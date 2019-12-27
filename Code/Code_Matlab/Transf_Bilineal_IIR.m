clc;clear all; close all;
%Polinomio Numerador
b0= 0.128 ; b1=0.006;  b2=-0.122;
b= [b0  b1  b2];
%Polinomio Denominador
a0=1;  a1=0.0006;  a2=0.975;
a=[a0  a1  a2];
%Polos
polos=roots(a)
AngPolos=angle(polos)*180/pi
MagPolos=abs(polos)
%freqz(b,a)
fvtool(b,a)