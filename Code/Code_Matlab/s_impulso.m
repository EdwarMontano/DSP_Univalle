% GENERACIÓN SEÑAL IMPULSIONAL 
% Salida: x secuencia de salida, n instantes 
% Entrada: A amplitud del impulso, D desplazamiento temporal 
% ni instante inicial, nf instante final; donde ni<=n<=nf

function [x,n]= s_impulso(A,D,ni, nf)
   n= [ni:nf]; 
   x=A*[(n-D)==0]; 
end