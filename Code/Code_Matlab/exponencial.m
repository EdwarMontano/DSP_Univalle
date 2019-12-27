%Senal Exponencial a^n para todo n
%     a=base real en este caso
%     D=desplazamiento
%  0<A<1 converge a 0
%  A>1   no converge
%  -1<A<0 alterna y converge a 0
%  A<-1  atlerna y no converge

a=0.8;
ni=0;
nf=20;
[x,n]=s_exponencial(a,ni,nf);
stem(n,x,'b','LineWidth',2);
axis(min(n)-1, max(n)+1, min(x)-1, max(x)+1);
grid on;
title('Señal rampa','color','k'); 
xlabel('n'); 
ylabel('x(n)');