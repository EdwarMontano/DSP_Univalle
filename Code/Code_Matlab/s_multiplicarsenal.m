% MULTIPLICACIÓN DE SEÑALES 
% Salida: y secuencia de salida, n instantes
% Entrada: X1 y X2 Señales a multiplicar 
% N1 y N2 vector de instantes de las señales X1 y X2 respectivamente.

function [y,n]= s_multiplicarsenal(N1,X1,N2,X2)
    minN1=min(N1); 
    maxN1=max(N1);
    minN2=min(N2); 
    maxN2=max(N2);
    n= min(minN1,minN2):max(maxN1,maxN2); %vector de instantes salida 
    y1=zeros(1,length(n)); 
    y2=y1; %vectores temporales 
    y1((n>=minN1)& (n<=maxN1) ==1 )=X1; %Ajustar longitud de X1 
    y2((n>=minN2)& (n<=maxN2) ==1 )=X2; %Ajustar longitud de X2 
    y=y1.*y2; %Multiplicación punto a punto
end