% GENERACI�N SE�AL DESPLAZAMIENTO TEMPORAL 
% Salida: y secuencia desplazada, n vector instantes desplazados 
% Entrada: XX se�al de entrada % NN instantes se�al entrada 
% K desplazamiento (K positivo= adelanto // K negativo= atraso)


function [y,n]= s_desplazamiento(XX,NN,K)
    %Verificaci�n de las longitudes de XX y NN 
    if length(XX)==length(NN) 
       y=XX; 
       n=NN-K;   %La operaci�n recae sobre el vector de instantes 
    else
       error('Se�al de entrada e instantes difieren en longitud'); 
end