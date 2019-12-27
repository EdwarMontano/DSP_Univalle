% GENERACIÓN SEÑAL DESPLAZAMIENTO TEMPORAL 
% Salida: y secuencia desplazada, n vector instantes desplazados 
% Entrada: XX señal de entrada % NN instantes señal entrada 
% K desplazamiento (K positivo= adelanto // K negativo= atraso)


function [y,n]= s_desplazamiento(XX,NN,K)
    %Verificación de las longitudes de XX y NN 
    if length(XX)==length(NN) 
       y=XX; 
       n=NN-K;   %La operación recae sobre el vector de instantes 
    else
       error('Señal de entrada e instantes difieren en longitud'); 
end