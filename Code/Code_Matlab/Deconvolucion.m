function [ x ] = Deconvolucion( h,y)
%Deconvolucion2: obtiene x(n) de un sistema causal a partir de h(n) y y(n) 
%mediante una ecuaci{on recursiva dgerivada de la Convolución.

if h(1)~=0.0
 x(1)=y(1)/h(1);
 ly=length(y); %longitud de y(n)
 lh=length(h); %longitud de h(n)
 lx=ly-lh+1; %longitud de la señal x(n)
  
 for n=1:lx-1 
    temp=0;
    for k=0: n-1
      m=n-k+1; %verificar tamaño de h
      if m<=lh  
        temp=temp+ x(k+1)*h(m);  
      end 
    end     
    x(n+1)=(y(n+1)-temp)/h(1);
 end
  
else
 msgbox('división por cero: h(0)=0','Deconvolucion','warn')
end

end

