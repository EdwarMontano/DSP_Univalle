clc; clearvars; close all;
%Prueba convergencia de series

%K1= 2;
%K2= 14;

K1= 14;
K2= 2;


a=1/2;
if a~=1 
    n1=K1:1:K2-1;
    suma1=sum(a.^n1)
    %Verificación
    suma2= (a^K1-a^K2)/(1-a)
else

    errordlg('a debe ser diferente de 1',' Error de parámetro');

end


% 
% i=0;
% for L=-1:-1:-20
%     
% 
%     for n=0:9
%        i=i+1;
%         ind(i)=-n-L-1;
%     end
% end
% 
% stem(ind)
