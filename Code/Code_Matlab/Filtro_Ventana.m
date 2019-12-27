clc; clear all; close all;
%Parametros del Filtro FIR
Mensaje1='Frecuencia de corte wc(xPi Rad/m) (0-1)?';
Mensaje2='Longitud M?' ;
Mensaje3='Ventana (Rect=0 Hann=1 Hamm=2 Black=3)';
Param=inputdlg({Mensaje1, Mensaje2, Mensaje3},'Filtro Paso Bajo - Enventanado',1, {'0.3', '21', '0'}); 

wc=pi*str2double(Param{1});
M=str2double(Param{2});
Wind=str2double(Param{3});

%% Determinar si M es par o Impar
if rem(M,2) == 0
    fprintf('The number is even\n');
    n1=0:M/2-1;  
    hd1= sin(wc.*(n1-(M-1)/2))./(pi.*(n1-(M-1)/2));
   
    n2=(M/2): M-1; 
    hd2= sin(wc.*(n2-(M-1)/2))./(pi.*(n2-(M-1)/2));
    n=[n1  n2];
    hd=[hd1 hd2];
    
else
    fprintf('The number is odd\n');
    
    n1=0:((M-1)/2)-1;   
    hd1= sin(wc.*(n1-(M-1)/2))./(pi.*(n1-(M-1)/2));

    n2=(M-1)/2;
    hd2=wc/pi;
    
    n3=(((M-1)/2)+1): M-1; 
    hd3= sin(wc.*(n3-(M-1)/2))./(pi.*(n3-(M-1)/2));
    
    n=[n1  n2  n3];
    hd=[hd1 hd2  hd3];
    
end

%% Ventana 
switch Wind
            case 0; %Rectangular
                V=ones(1,M);
            case 1; %Hanning
                V=(1-cos(2*pi*n/(M-1)))/2;
            case 2; %Hamming
                V=0.54-0.46*cos(2*pi*n/(M-1));
            case 3; % Blackman
                 V=0.42-0.5*cos(2*pi*n/(M-1))+0.08*cos(4*pi*n/(M-1));
            otherwise
                errordlg('Tipo de Ventana no soportado')
        end  

%% Aplicar Ventana al Filtro Ideal
h=hd.*V;

% Respuesta en Frecuencia
[H, w]=freqz(h);
 
% Graficación
subplot(2,2,1); stem(n, h), grid on;title('Respuesta Impulsional h(n)'); 
xlabel ('n'); ylabel('h(n)');
subplot(2,2,2); plot(w/pi, abs(H)); grid on; title('Magnitud de H(w)'); 
xlabel ('w normalizado (x \pi rad/muestra)'); ylabel('|H(w)|');
subplot(2,2,3); stem(n,V); grid on; title('Ventana'); 
xlabel ('n'); ylabel('w(n)');
subplot(2,2,4); plot(w/pi, unwrap(angle(H))); grid on;title('Fase de H(w)'); 
xlabel ('w normalizado (x \pi rad/muestra)'); ylabel('|\_H(w) (rad)');

