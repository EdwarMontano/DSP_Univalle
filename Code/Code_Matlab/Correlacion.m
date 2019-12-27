function [r, Li,Lf] = Correlacion(x, ni_x, y, ni_y )
%Correlación: calcula la correlación r(L) entre las señales x(n) y y(n) 
%             r(L)= suma_n [x(n) y(n-L)]

% ENTRADA
% x: vector con los valores  señal discreta x(n)
% ni_x: entero con el instante correspondiente a la primera muestra de x(n)
% y: vector con los valores señal discreta y(n)
% ni_y: entero con el instante correspondiente a la primera muestra de x(n
% SALIDA
% r: vector con los valores de la correlación sin normalizar
% Li: instante inicial de r(L) 
% Lf: instante final de r(L) 

    % Longitud e instante de la señal x(n)
    lx=length(x);
    nf_x=lx+ni_x -1; %instante final de x(n)

    % Longitud e instante de la señal y(n)
    ly=length(y);
    nf_y=ly+ni_y -1; %instante final de y(n)
  
    % Rango de valores de L y longitud de r(L)
    Li=ni_x-nf_y;
    Lf=nf_x-ni_y;
    Lr=lx+ly-1; %longitud de r(L)
           
    % Cálculo de la correlación 
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

