%Senal Exponencial compleja x(n)= A^n para todo n
%        A= complejo = a+jb
%  0<A<1 converge a 0
%  A>1   no converge
%  -1<A<0 alterna y converge a 0
%  A<-1  atlerna y no converge

A=1+j*1;
ni=0;
nf=20;
[x,n]=s_exponencialcompleja(A,ni,nf);
if isreal(x) % si señal real gráfica x(n) 
    graf_stem(n,x,'Exponencial- Base Real','x(n)');
else   % si señal compleja 
    %gráfica parte Real 
    xreal=real(x); 
    subplot(2,2,1); 
    graf_stem(n,xreal,'Exponencial - Parte Real','x_r_e_a_l (n)');
    %grafica parte imaginaria 
    ximag=imag(x);
    subplot(2,2,2);
    graf_stem(n,ximag,'Exponencial - Parte Imaginarial','x_i_m_a_g(n)');
    %Gráfica Magnitud
    xmag =abs(x);
    subplot(2,2,3);
    graf_stem(n,xmag,'Exponencial - Magnitud','x_m_a_g(n)');
    %Gráfica ángulo de fase
    xfas =angle(x);
    subplot(2,2,4);
    graf_stem(n,xfas,'Exponencial - Fase','x_f_a_s_e(n)');
    set(gca,'YTick',-pi:pi/2:pi);   %set fija propiedades
    set(gca,'YTickLabel',{'-pi','-pi/2','0','pi/2','pi'});
end

  
   