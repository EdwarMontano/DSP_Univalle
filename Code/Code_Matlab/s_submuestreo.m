% GENERACIÓN ESCALAMIENTO TEMPORAL 
% Salida: y secuencia remuestreada, n vector instantes remuestreados 
% Entrada: XX señal de entrada, NN instantes señal entrada 
% ALPHA factor de submuestreo (entero positivo)

function [y,n]= s_submuestreo(XX,NN,ALPHA)
    if length(XX)==length(NN) %Verificación longitudes de XX y NN 
        j=0; 
        for i=1:length(NN) 
            if (rem(NN(i),ALPHA)== 0) %verificación de residuo 
                j=j+1; 
                m(j)=NN(i); 
                y(j)=XX(i); 
            end
        end n=m/ALPHA;
    else
        error('Señal de entrada e instantes difieren en longitud'); 
end