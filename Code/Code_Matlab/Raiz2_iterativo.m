% Sistema que calcula iterativamente 
% la raíz cuadrada de un número MAYOR QUE 1;
% y(n)=0.5*[y(n-1)+x(n)/y(n-1)];
% x(n)=a u(n); donde  a>1 es la entrada.
clc; clear all; close all;

% Entrada x(n)=A u(n), L , y(n-1)
dlg_title = 'Operación?';
prompt = { 'Entrada A:','Duración L de x(n):','y(n-1):'};
num_lines = 1;
defaultans = {'2', '12', '1'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);

% Obtención de x(n)=A u(n), L , y(n-1) 
a=str2num(answer{1});
L=str2num(answer{2});   
yini=str2num(answer{3}); 

x=a*ones(1,L);
if a==0
   errordlg('Error: a debe SER MAYOR A CERO','Valor Error'); 
end    
% Valor de y(0)
n=0; m=n+1;
y(m)=yini ; 
%n=0; m=n+1;

for n=1:L-1
   m=n+1;
   y(m)=0.5*(y(m-1)+x(m)./y(m-1));
end
Err_raiz=sqrt(a)-y; %Error en cada iteración;
subplot(2,2,1); stem([0:L-1],x); title(['x(n)= '  num2str(a)]); grid on;
subplot(2,2,2); stem([0:L-1],y); title(['y(n)= sqrt(' num2str(a) ')']);grid on;
subplot(2,2,3:4);stem([0:L-1],Err_raiz); title('Error= x(n)- y(n)');
grid on;


