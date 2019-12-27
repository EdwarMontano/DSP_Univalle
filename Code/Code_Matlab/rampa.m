%senal rampa: x(n-D)=n para n>=D y 0 para n<=D
%D=desplazamiento = cruce por cero

%pendiente=;
ni=-10;
nf=40;
D=0;
[x,n]=s_rampa(D,ni,nf);
stem(n,x,'b', 'LineWidth',2);
axis(min(n)-1, max(n)+1, min(x)-1, max(x)+1);
grid;
title('Señal rampa','color','k'); 
xlabel('n'); 
ylabel('x(n)');