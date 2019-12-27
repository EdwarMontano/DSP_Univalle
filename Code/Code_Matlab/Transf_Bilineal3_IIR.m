clc;clear all; close all;


%a=exp(-0.25); b=exp(-0.2); c= exp(-0.15);

%a=[1  -(a+b+c)    ((a*b)+c*(a+b))    -a*b*c  ]

%Polinomio Numerador
%b0= 1; b1= -0.6699 ; b2=0 ;b3=0;
b0=-0.0667;  b1=0.1333 ; b2= 0.2;
b= [b0  b1  b2];


%Polinomio Denominador
a0=1;  a1=-0.1333 ; a2=-0.0667;  
a=[a0  a1  a2];
%Polos
polos=roots(a)
AngPolos=angle(polos)*180/pi
MagPolos=abs(polos)
%freqz(b,a)
fvtool(b,a)