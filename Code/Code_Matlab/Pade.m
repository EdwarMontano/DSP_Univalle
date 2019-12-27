clc; close all; clear all; 

% Respuesta h(n): Se supone que el primer valor corresponde a h(0).
% num H(z)= b0+ b1 z^(-1) +...+ bM z^(-M) 
% den H(z)= 1 + a1 z^(-1) +...+ aN z^(-N)

%h=[0.2  0.32 0.192 0.1152 0.0691 0.0415 0.0249 0.0149 0.009 0.0054  0.0032
%]; %PASO BAJO
%M=1;N=1;

h=[0.1311 0.0632  -0.3380 -0.1843  0.2949  0.1974  -0.0936  -0.0878  -0.0019   -0.0049  0.0047];% bANDA DE PASO M=4;N=4;

M=4; N=1;



%PASO 1: Evaluar n>M para encontrar los coeficientes ai i=0-->N; a0=1
for x=1:1:N
    for y=1:1:N
        A(x,y)=-h(N-y+x+1); 
        %El uno es para hacer coincidir la notación según índices en matlab.
    end
    b(x)=h(N+x+1);
end
 
%Coeficientes ai (i=0,2,..N)
 
%Calculo de coeficientes desde i=1-->N; siempre a0=1

% Determinar si la matriz A es singular
prueba= inv(A); 
if (prueba==Inf | prueba==NaN )
    coef_a=pinv(A)*b' ; % si es singular, forma alterna de calcular solución 
else
    coef_a=A\b' ;
end 
 
disp(['Coeficientes ai, i=0-->' num2str(N)])
aa=[1 coef_a']

% PASO 2:  Evaluar 0 <= n <= M para encontrar los coeficientes bi ; i=0,..M
bb(0+1)=h(0+1);
for k=1:M
    c=h(k+1);
    for j=1:k
        c=c+coef_a(j)*h(k-j+1);
    end
    bb(k+1)=c;
end 
disp(['Coeficientes bi, i=0-->' num2str(M)  ])
bb

% Respuesta en frecuencia
[H,w]=freqz (bb, aa );
 
% Frecuencia de corte
ind_wc1=find(abs(H)>(1/sqrt(2)),1,'last');
ind_wc2=find(abs(H)<(1/sqrt(2)),1,'first');
if abs(abs(H(ind_wc1))-1/sqrt(2))< abs(abs(H(ind_wc1))-1/sqrt(2))
    ind_wc=ind_wc1;
else 
    ind_wc=ind_wc2;
end
wc=w(ind_wc)
 
% Graficación
subplot(2,1,1); plot(w,abs(H)); grid on; 
title ( ['Respuesta en Frecuencia- Aprox. Padé.  M= ' num2str(M) '  N= ' num2str(N)] )
xlabel('w'); ylabel('|H(w)|');
text(w(ind_wc), abs(H(ind_wc)),'\leftarrow wc','HorizontalAlignment','left')
 
subplot(2,1,2); plot(w,angle(H)); grid on;
title ( ['Frecuencia de corte wc=' num2str(wc)]);
xlabel('w'); ylabel('Fase(w)');
 
% Respuesta impulsional deseada
figure
stem(0:1:length(h)-1,h); grid on; 
xlabel('n'); ylabel('h(n)');


