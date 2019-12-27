% GENERACI�N ESCALAMIENTO TEMPORAL 
% Salida: y secuencia remuestreada, n vector instantes remuestreados 
% Entrada: XX se�al de entrada, NN instantes se�al entrada 
% ALPHA factor de submuestreo (entero positivo)

function [y,n]= s_submuestreo(XX,NN,ALPHA)
    if length(XX)==length(NN) %Verificaci�n longitudes de XX y NN 
        j=0; 
        for i=1:length(NN) 
            if (rem(NN(i),ALPHA)== 0) %verificaci�n de residuo 
                j=j+1; 
                m(j)=NN(i); 
                y(j)=XX(i); 
            end
        end n=m/ALPHA;
    else
        error('Se�al de entrada e instantes difieren en longitud'); 
end