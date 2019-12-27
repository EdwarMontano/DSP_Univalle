% Ejemplo de Script: Determina el rango
%de un cuadrado magico

clear all;
r=zeros(1,32);
for n=3:32
    %r(n)=sin(n/2);
    r(n)=rank(magic(n));
end 
r
bar(r)

% 1. hace una matriz de ceros 1x32         rank(magic(n));
% 2. para n de 3 a 32 hace el rango del cuadrado magico de la matriz r
%   cuando es de tamano nxn. El rango sirve para estimar la linealidad de filas
%   o columnas indep de una matriz. 
% 3. muestra la matriz r
% 4. bar(r) dibuja las columnas de la matriz r de tamano MxN. El eje Y como M 
%    grupos de N barras verticales. Bar(Y) usa por defecto X=1:M. 