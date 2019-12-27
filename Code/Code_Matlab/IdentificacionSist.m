function [ h ] = IdentificacionSist( x, y )
%IdentificacionSist. Calcula la respuesta impulsional de un
%sistema LTI causal a partir de x(n) y y(n)

 if x(1)~=0.0
   h(1)=y(1)/x(1);
   lx=length(x); %longitud de y(n)
   ly=length(y); %longitud de x(n)
   lh=ly-lx+1; %longitud de la señal h(n)
  
   for n=1:lh-1
      temp=0;
      for k=1:n
        m=n-k+1; %verificar tamaño de h
        if k<lx
          temp=temp+ x(k+1)*h(m);  
        end 
      end     
      h(n+1)=(y(n+1)-temp)/x(1);
   end
 else
   msgbox('división por cero: x(0)=0','Identificacion','warn')
 end
end

