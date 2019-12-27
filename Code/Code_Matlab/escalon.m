% Generacion de la senal escalon
% Salida: x secuencia de salida
%         n instantes
% Entrada: A amplitud
%          D desplazamiento temporal
%          ni instante inicial
%          nf instante final
%          ni<=n<=nf
           
         A=3.4;
         D=2;
         ni=-20;
         nf=20;    
         [x,n]=s_escalon(A,D,ni,nf); %se llama a la funcion escalon
         stem(n,x,'b', 'LineWidth',2); 
         axis([min(n)-1, max(n)+1, min(x)-1, max(x)+1]); 
         grid on; 
         title('Señal escalón','color','k'); 
         xlabel('n'); 
         ylabel('x(n)');