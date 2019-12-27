function [r, Li,Lf] = Correlacion(x, ni_x, y, ni_y )
%Correlaci�n: calcula la correlaci�n r(L) entre las se�ales x(n) y y(n) 
%             r(L)= suma_n [x(n) y(n-L)]

% ENTRADA
% x: vector con los valores  se�al discreta x(n)
% ni_x: entero con el instante correspondiente a la primera muestra de x(n)
% y: vector con los valores se�al discreta y(n)
% ni_y: entero con el instante correspondiente a la primera muestra de x(n
% SALIDA
% r: vector con los valores de la correlaci�n sin normalizar
% Li: instante inicial de r(L) 
% Lf: instante final de r(L) 

    % Longitud e instante de la se�al x(n)
    lx=length(x);
    nf_x=lx+ni_x -1; %instante final de x(n)

    % Longitud e instante de la se�al y(n)
    ly=length(y);
    nf_y=ly+ni_y -1; %instante final de y(n)
  
    % Rango de valores de L y longitud de r(L)
    Li=ni_x-nf_y;
    Lf=nf_x-ni_y;
    Lr=lx+ly-1; %longitud de r(L)
           
    % C�lculo de la correlaci�n 
    r=zeros(1,Lr);
    i=0;
    for L=Li:Lf
       i=i+1;  
       temp=0; 
       for n= ni_x: nf_x
           nx=n-ni_x+1; %ajuste del indice de x(n) para evitar salir rango de Matlab
           ind= n-L;
           if ind >= ni_y && ind <= nf_y
             n_L= ind-ni_y+1;  %ajuste del indice de y(n-L) para evitar salir rango de Matlab
             temp=temp+x(nx)*y(n_L);
           end
       end
       r(i)=temp;
    end
end

