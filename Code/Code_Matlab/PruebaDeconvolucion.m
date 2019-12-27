clc; clear all; close all;

%Prueba 1
% y1=[-2  -4  1  3  1  5  1  -3];
% h1=[1 2 0 -1];
% 
% x1=Deconvolucion(h1,y1)

%Prueba  2
h2=[1  2  3  -2  -1 ];
x2=[-3 -2 -1 0 1 2 3 ]
y2=conv(h2,x2)
y2 =[-3    -8   -14    -2     5     8    11    10     4    -8    -3]


x2=Deconvolucion(h2,y2)

h=[1  2  3  -2  -1 ];
y =[-3    -8   -14    -2     5     8    11    10     4    -8    -3];
x=Deconvolucion(h,y) ; %salida