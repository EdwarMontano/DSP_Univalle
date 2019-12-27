% GENERACIÓN SEÑAL REFLEXADA EN EL TIEMPO 
% Salida: y secuencia reflejada, n vector instantes reflejada 
% Entrada: XX señal de entrada 
% NN instantes señal entrada

function [y,n]= s_reflexion(XX,NN)
   if length(XX)==length(NN) 
       y = fliplr(XX); 
       n = -fliplr(NN); 
   else
       error('Señal de entrada e instantes difieren en longitud');
end