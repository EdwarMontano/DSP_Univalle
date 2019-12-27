% GENERACIÓN SEÑAL IMPULSIONAL 
% Salida: x secuencia de salida, n instantes 
% Entrada: A amplitud del impulso, D desplazamiento temporal 
% ni instante inicial, nf instante final; donde ni<=n<=nf

A=2; 
D=-3; 
ni=-5; 
nf=7; 
[x,n]=s_impulso(A,D,ni,nf); 
stem(n,x,'b', 'LineWidth',2); 
axis([min(n)-1, max(n)+1, min(x)-1, max(x) + 1]); 
grid on; title('Señal impulso','color','k'); 
xlabel('n'); 
ylabel('x(n)');