clc; clear all; close all;

%Prueba 1
% y1=[-2  -4  1  3  1  5  1  -3];
% 
% x1=[-2 0 1  -1 3];
% 
% h1=IdentificacionSist(x1,y1)


% Prueba  2
% 
% y2=[6 10 3 -2 5 -6 ];
% x2=[3  -1 2];
% h2=IdentificacionSist(x2,y2)

%verificacion
x=[3  -4  4 -3  5 -2 ];  
h=[-1 1 5 1  -1]
%y=conv(x,h)

x=[3  -4  4 -3  5 -2 ];  %ojo
y=[-3 7  7 -10 5 0  16  -2   -7  2];
h=IdentificacionSist(x,y)
