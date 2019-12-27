clc; clear var; close all;
%
% num=[1 -5 6]
% den=[1 -2.5 1];
%
%num=[1 -3  ];
%den=[1 -1/2];

% num=[1.0000    5.2500    7.2500    1.5000]; 
% ceros=roots(flip(num))
% den=[1 -2.5 1];

% num=[1  -0.3];
% den=[1  -0.3  -0.24  0.08];

num=[1  -0.3];
den=[1  0.1  -0.2];

[Resi,Polos, TDirec]=residuez(num,den)
% 
% A=[1 1; 1/2 2]; x=[-6.25 ; 7.7];
% b=A\x
