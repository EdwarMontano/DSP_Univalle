% GENERACI�N SE�AL REFLEXADA EN EL TIEMPO 
% Salida: y secuencia reflejada, n vector instantes reflejada 
% Entrada: XX se�al de entrada 
% NN instantes se�al entrada

function [y,n]= s_reflexion(XX,NN)
   if length(XX)==length(NN) 
       y = fliplr(XX); 
       n = -fliplr(NN); 
   else
       error('Se�al de entrada e instantes difieren en longitud');
end