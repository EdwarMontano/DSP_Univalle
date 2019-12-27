function  [h]= s_muestreofrec(Alpha, Beta, M, Hr )
% DISEÑO FILTROS FIR - MUESTREO EN FRECUENCIA
% Salida: h vector parametros filtro de longitud M 
% Entrada: Alpha = 0  ó 0.5
%          Beta= 0 (Simetría par) ó 1 (Simetría impar)
%          M, orden filtro igual a la longitud  
%          Hr valores respuesta en frecuencia deseada (Aprox. igual a la mitad del orden)
%

h=zeros(1,M);  %Vector coeficientes filtro
if rem(M,2) == 0  % M Par
  U=(M/2)-1;
  flag='Mpar';
  V=(M/2)-1;
else % M impar 
  U=(M-1)/2;
  flag='Mimpar';
  V=(M-3)/2;
end

select=Alpha+Beta;
switch select
    case {0, 0.5, 1}  %1)Alpha=0 y Beta=0 --2) Alpha=0.5 y Beta=0 --3) Alpha=0 y Beta=1; 
        G=((-1).^(0:U)).*Hr;
    case 1.5
        switch flag
            case 'Mpar'  
              GV=((-1).^(0:V)).*Hr;
            case 'Mimpar'
              GV=((-1).^(0:V)).*Hr; 
        end 
end
h_aux=zeros(1,U+1);
%Verificación parámetros
if (Alpha==0 | Alpha==0.5)
    
 if (Beta==0 | Beta==1)
    
    %select=Alpha+Beta;
    
    switch  select
        %******Caso I ******
        case 0  %beta=0,  alpha=0
                       
            for n=0:U
                suma=0;
                for k=1:U
                    suma=suma+G(k+1)*cos(2*pi*k*(n+1/2)/(M));
                end
                h_aux(n+1)= (G(1)+2*suma)/(M);
            end
            %Completar vector simétrico
            if strcmp(flag,'Mpar');
                h=[h_aux(1:U+1) fliplr(h_aux(1:U+1))];
            end
            if strcmp(flag,'Mimpar');
                h=[h_aux(1:U+1)  fliplr(h_aux(1:U))]; 
            end
            
        %******Caso II ******
        case 0.5  %beta=0,  alpha=0.5
      
            for n=0:U
                suma=0;
                for k=0:U
                    suma=suma+G(k+1)*sin(2*pi*(k+1/2)*(n+1/2)/(M));
                end
                h_aux(n+1)= 2*suma/(M);
            end
            %Completar vector simetrico
            if strcmp(flag,'Mpar');
                h=[h_aux(1:U+1)  fliplr(h_aux(1:U+1))];
            end
            if strcmp(flag,'Mimpar');
                h=[h_aux(1:U+1)  fliplr(h_aux(1:U))]; 
            end
            
          
        %******Caso III ******    
        case 1.0  %beta=1,  alpha=0
    
            display('Caso III')
            
         if strcmp(flag,'Mpar')   
             
             for n=0:U
                suma=0;
                for k=1:U
                    suma=suma+G(k+1)*sin(2*pi*k*(n+1/2)/(M+1));
                end
                h_aux(n+1)= -2*suma/(M+1);
             end
             %Completar vector Anti-simetrico
             h=[h_aux(1:U+1)  -fliplr(h_aux(1:U))]; 
             
         end   
                  
         if strcmp(flag,'Mimpar')
             for n=0:U
                suma=0;
                for k=1:U
                    suma=suma+G(k+1)*sin(2*pi*k*(n+1/2)/(M+1));
                end
                h_aux(n+1)= ( (-1)^(n+1)*G((M+1)/2)- 2*suma)/(M+1) ;
             end
             %Completar vector Anti-simetrico
             h=[h_aux(1:U+1)  -fliplr(h_aux(1:U+1))];
         end   
             
                 
        %******Caso IV ******    
        case 1.5  %beta=1,  alpha=0.5
            display('Caso IV')
        
            for n=0:V
                suma=0;
                for k=0:V
                    suma=suma+GV(k+1)*cos(2*pi*(k+1/2)*(n+1/2)/(M+1));
                end
                h_aux(n+1)= 2*suma/(M+1);
            end
            %Completar vector Anti-simetrico
            if strcmp(flag,'Mpar');
                display ('Aquiiiii')
                h=[h_aux(1:V+1)  0  -fliplr(h_aux(1:V+1))];
            end
            
            if strcmp(flag,'Mimpar');
                h=[h_aux(1:V+1)  -fliplr(h_aux(1:V+1))];
            end
             
    end
    
 else
   display('Error: valor no valido de beta')    
 end
else
 display('Error: valor no valido de alfa')
end

end %function
