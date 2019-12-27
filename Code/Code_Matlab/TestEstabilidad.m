function [ K, ESTADO] = TestEstabilidad( DEN )
% UNTITLED2 Summary of this function goes here
% Detailed explanation goes here
% TEST DE SCHUR-COHN 
% Salida:   K Vector de coeficientes de reflexión,  ESTADO texto condición
%           de estabilidad.
% Entrada:  DEN coeficientes polinomio numerador de la forma
%           1 + a1 z^(-1)+ a2 z^(2)+...+aN z^(-N)

    if DEN(1)==1  %Verificación primer coeficiente igual a 1
        %Cálculo de constantes de reflexión
        N=length(DEN)-1;
        A{N}=DEN;
        B{N}=fliplr(DEN);    %tempo
        K(N)=DEN(N+1);
       
        g=(N-1);
       while  ( g>=1 && all(K~=1))
            Aux=(A{g+1}-K(g+1).*B{g+1} )./(1- K(g+1)^2) ;
            A{g}=Aux(1:g+1);
            B{g}=fliplr(Aux(1:g+1));
            K(g)=A{g}(g+1); 
            g=g-1;
       end  
        %Determinar estabilidad
        if all (K<1)
            ESTADO='Sistema Estable';
        else
            ESTADO='Sistema Inestable';
        end
    else
        display('Primer coeficiente del polinomio diferente de 1')
        K=NaN;
        ESTADO='Indefinido';
        return
    end

end

