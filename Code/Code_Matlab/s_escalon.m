         function[x,n]=s_escalon(A,D,ni,nf)
             n=[ni:nf];
             x=A*[(n-D)>=0];
         end
         
         % Lo que esta dentro de los [] es como un sentencia logica
         %si es valida la condicion retorna 1 si no es valida retorna 0.
         % y asi se logra que x sea A para valores mayores a D y 0 para
         % valores menores de D. 
         

