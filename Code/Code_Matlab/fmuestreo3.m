function  [h]= fmuestreo3(Alpha, Beta, M, Hr )
% DISE�O FILTROS FIR - MUESTREO EN FRECUENCIA
% Salida: h vector parametros filtro de longitud M 
% Entrada: Alpha = 0
%          Beta= 1 (Simetr�a par) 
%          M, orden filtro igual a la longitud  
%          Hr valores respuesta en frecuencia deseada (Aprox. igual a la mitad del orden)

    if Alpha==0 && Beta==1 

        if rem(M,2) == 0  % M Par
          U=(M/2)-1;
          flag='Mpar';
          h=zeros(1,M);  %Vector coeficientes filtro
          G=((-1).^(0:U)).*Hr;
          for n=0: M-1
              suma1=0;
              for k=1:U
                  K=k+1;
                  suma1=suma1+G(K)*sin(2*pi*k*(n+0.5)/M);
              end
              N=n+1;
              h(N)= ((-1)^(n+1)* G(M/2)-2*suma1)/M;
          end

          
          
          
        else % M impar 
           U=(M-1)/2;
           flag='Mimpar';
           h=zeros(1,M);  %Vector coeficientes filtro
           G=((-1).^(0:U)).*Hr;
           for n=0: M-1
               suma1=0;
               for k=1:U
                   K=k+1;
                   suma1=suma1+G(K)*sin(2*pi*k*(n+0.5)/M);
               end
               N=n+1;
               h(N)= -2*suma1/M;
           end
           
        
        end

        if length(Hr)== U+1
        
        else 
         errordlg('Valores de length(Hr)!= U+1 ','Error valores');
         error=0;    % Se trabajar� solo con los datos permtidos
   
        end
        
%         h=zeros(1,M);  %Vector coeficientes filtro
%         G=((-1).^(0:U)).*Hr;
%         for n=0: M-1
%             suma1=0;
%             for k=1:U
%                 K=k+1;
%                 suma1=suma1+G(K)*cos(2*pi*k*(n+0.5)/M);
%             end
%             N=n+1;
%             h(N)= (G(1)+2*suma1)/M;
%         end

    else
         errordlg('Valores de Alfa!=0 y Beta!=1 ','Error valores');
         error=0;    % Se trabajar� solo con los datos permtidos

    end %


end %function
