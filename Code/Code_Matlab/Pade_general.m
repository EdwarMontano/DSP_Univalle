clc; close all
clearvars; 

% Respuesta impulsional prototipo. Se supone que el primer valor en el
% vector corresponde a h(0).
% Sistema supuesto
% num H(z)= b0+ b1 z^(-1) +...+ bM z^(-M) 
% den H(z)= 1 + a1 z^(-1) +...+ aN z^(-N)

%% Ejemplo 2: !!!!
h=[0.2  0.32 0.192 0.1152 0.0691 0.0415 0.0249 0.0149 0.009 0.0054  0.0032 ]; %paso bajo
M=3;N=3;

%% Ejemplo 3:
%h=[1.0000    4.8000    9.1425    8.1427    1.9554   -2.6448  -2.3176    0.0894    1.1614   ...
%    0.5372   -0.2942   -0.4075   -0.0611    0.1671];
%M=4;
%N=4;

%% Ejemplo 4:
% h=[0 1 2 3 4 5 4 3 2 1 0];
% M=2;
% N=2;

%% Ejemplo 5:
% h=[0 1 2 3 4 5 4 3 2 1 0];
% M=5;
% N=3;

%% Ejemplo 6: banda de paso
% h=[0.1311 0.0632  -0.3380 -0.1843  0.2949  0.1974  -0.0936  -0.0878  -0.0019   -0.0049  0.0047];% bANDA DE PASO M=4;N=4;
% M=4; N=4;

% Generado realmente por
 %h(n) fue generado por el siguiente H(z)
 %NUM= [0.1311         0   -0.2622         0    0.1311]
 %DEN= [1.0000   -0.4820    0.8104   -0.2275    0.2725]

%

%%
%PASO 1: Evaluar n>M para encontrar los coeficientes ai i=0-->N, 
%        El coeficiente a0 siempre es 1

Lh=length(h);

for x=1:1:N
  
    for y=1:1:N
        index1=N-y+x+1; %El uno es para hacer coincidir la notación según indices en matlab.
        if index1<=Lh
          A(x,y)=-h(index1); 
        end 
    end
    
    %index2=N+x+1;
    index2=M+x+1;
    %if index2 <= Lh 
      b(x)=h(index2);
    %end

end

%Coeficientes ai (i=0,2,..N)

%Calculo de coeficientes i=1-->N; 
prueba= inv(A);

%if (prueba==Inf | prueba==NaN )
if (prueba==Inf | isnan(prueba) )

    coef_a=pinv(A)*b' ; % Si es singular:forma alterna de calcular solución 

else
   % coef_a=A\b' ;
   Lb=length(b); 
   coef_a=A(1:Lb, 1:Lb)\b' ; %Se garantiza que sean iguales en tamaño
end 

disp(['Coeficientes ai, i=0-->' num2str(N)])
aa=[1 coef_a']



% PASO 2:  Evaluar 0 <= n <= M para encontrar los coeficientes bi ; i=0,..M

bb(0+1)=h(0+1);

for k=1:M
    index3=k+1;
    if index3 <=Lh 
      c=h(k+1);
      for j=1:k
          if j<=N   ; %Para garantizar que se indece coef_a() adecuadamente
            c=c+coef_a(j)*h(k-j+1); 
          end
      end
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
xlabel('w rad/muestra'); ylabel('|H(w)|');
text(w(ind_wc), abs(H(ind_wc)),'\leftarrow wc','HorizontalAlignment','left')

subplot(2,1,2); plot(w,angle(H)); grid on;
title ( ['Frecuencia de corte wc=' num2str(wc)]);
xlabel('w rad/muestra'); ylabel('Fase(w)');


% Respuesta impulsional deseada
figure
subplot(2,2,1); stem(0:1:length(h)-1,h); grid on; 
xlabel('n'); ylabel('h(n)'); title('h(n) deseada')


% Respuesta impulsional estimada

Nm=length(h);  	    %Número de muestras a calcular
[x, nt]=impz(bb,aa,Nm);   
subplot(2,2,2);stem(nt,x); grid on;
xlabel('n'); ylabel('h(n)');title(['h(n) obtenida con M=' num2str(M) ' y N='  num2str(N) ])

% Error

subplot(2,2,3:4);stem(nt,h-x'); grid on;
xlabel('n'); ylabel('Error)');title( 'Error: h(n) - h^~(n)')




%% Borrar1

% num1=[0 1 0.75 0.5 0.25]
% den1=[1 -1.25 0 0 0 2.25  -2.5 ]
% [xprueba, nt]=impz(num1,den1,Nm)

%% Borrar2

% num1=[0 1 9/8 5/4 3/2 7/4]
% den1=[1 -7/8 0 1/8 ]
% [xprueba, nt]=impz(num1,den1,Nm)

%% Borrar3
% 
% num1=[0 1 2 3 -2]
% den1=[1 0  0 -6 7 ]
% [xprueba, nt]=impz(num1,den1,Nm)

%% Borrar4

% num1=[0 1 0  6 8 10]
% den1=[1 -2 7 -4 ]
% [xprueba, nt]=impz(num1,den1,Nm)
% 

