clc; clear all; close all;


%Ejemplo: 1  0.2  -0.37  0.01  0.0168


%Entrar datos ecuación de diferencia
K = inputdlg('Coeficientes Polinomio Característico: an r^n + an-1 r^(n-1) +...+ a0 ', 'y(n)=0', [1 50]);
Polinc = str2num(K{:}); 

%Raices Polinomio característico
r = roots(Polinc)

%Determinar estabilidad

rm=abs(r);
[fil,col]=find(rm>=1);

if (isempty(fil))
  titulo=['SI Estable: |Raices| < 1'];
  display('SI Estable: |Raices| < 1')
else
  titulo=['NO Estable: |Raices| >= 1'];
  display('NO Estable: |Raices| >= 1')
end

msgbox(num2str(r), titulo );



