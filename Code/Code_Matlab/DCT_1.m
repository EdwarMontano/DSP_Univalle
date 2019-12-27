clc; clear all; close all;
x=[0.0 0.1 0.3 0.4 0.3 0.2 0.1 0 -0.1 -0.2 -0.3 -0.2 -0.1 0];
N=length(x);
n=0:N-1;
X=dct(x); m=n;

fm=m/(2*N);
subplot(2,1,1); stem(n,x);xlabel('n');ylabel('x(n)');
title(['Time Signal x(n), N=' num2str(N)]);
subplot(2,1,2); stem(fm,X);xlabel('fm=m/(2N)');ylabel('X(m)');
title('DCT of Signal x(n)')
