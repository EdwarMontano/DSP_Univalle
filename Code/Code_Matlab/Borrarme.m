clc; clear vars; close all;


% Num1=[1 -1];
% Den1=[1  -1/3];
% 
% [r1,p1,k1]=residuez(Num1,Den1)

% A=[1  1;  1/4  1/2]; x=[1+96/85;  5/2-112/85];
% 
% b=A\x


A=[2*cos(0.3)   1; 2*cos(0.6)   1 ];
x=[0; 1];
b=A\x



% num=[1.0  -1.0  1.0];
% den=[1.0   0.5];
% 
% [r,p, k]=residuez(num,den)




% % Punto 3: Parcial 2, Semestre II-2018
% w1=0.3;
% w2=0.6;
% 
% A= [2*cos(w1)    1; 2*cos(w2)   1];
% b=[0 ; 1];
% x=A\b;
% 
% h=[x(1)  x(2)  x(1)]
% den=[1];
% %fvtool(h,den)
% 
% % Punto 4: Parcial 2, Semestre II-2018
% 
% n=0;
% h0= sin(pi*(n-1))./(pi*(n-1));
% 
% n=1;
% h1=1;
% 
% n=2:20;
% h2= sin(pi*(n-1))./(pi*(n-1));
% 
% h=[h0  h1  h2];
% n=0:20;
% stem(n, h); xlabel('n'); ylabel('h(n)')

% 
%Punto 3  Opcional 1
% Num1=[1.1  -0.04  -0.12];
% Den1=[1  0.3  -0.1];
% 
% Num2=Den1;
% Den2=Num1;
% 
% [r1,p1,k1]=residuez(Num1,Den1)
% [r2,p2,k2]=residuez(Num2,Den2)
% 

% % Transformada Seno
% 
% clearvars;
% x1=[0  1  2   3   4   5  4   3  2  1  ];
% x2=-x1;
% x=[ x1 x2]+4;
% ys =dst(x);
% yc =dct(x);
% 
% subplot(3,1,1); stem(x);title('x(n)');
% subplot(3,1,2); stem(yc);title('Transf. Coseno');
% subplot(3,1,3); stem(ys);title('Transf. Seno');

