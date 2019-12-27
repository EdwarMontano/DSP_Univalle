% Authors
%   Reza Arfa <rezaarfa (at)gmail.com>
%
% License
%   The program is free to use for non-commercial and academic purposes.
%
% Changes
%   01/01/2013 (!)

clc; close all; clear all;

% ========== init some variables:
iteration = 176;
fs = 10000;
t = -1:1/fs:1;

iterationSteps   = 1:1:iteration;
crossCorrelation = zeros(1,iteration);
convolution      = zeros(1,iteration);

set(gcf,'Color',[1 1 1]);


% ========== plot two signals (y1 and y2):
disp('Let y1 and y2 to be defined as following figures:')
disp('============================================================')
y1 = rectpuls(t,1);
%y1= gauspuls(t,1);
y2 = tripuls(t,0.5,-1);
subplot(4,2,1);plot(t,y1,'Color','blue','LineWidth',2),axis([-1 1 -0.2 1.2]);
ylabel('y1')
subplot(4,2,2);plot(t,y2,'Color','red','LineWidth',2),axis([-1 1 -0.2 1.2]);
ylabel('y2')


disp('Press Enter to continue ....')
pause



% ========== cross correlation of two signals (y1 and y2):
disp(' ');disp(' ')
disp('Cross Correlation of two signals (y1 and y2):')
disp('============================================================')

for i = 1:iteration
    
    moveStep = (i-100)/100;
    y1 = rectpuls(t,1);
    %y1=gauspuls(t,1);
    y2 = tripuls(t-moveStep,0.5,-1);
    
    subplot(4,2,3:4)
    hold off;plot(t,y1,'Color','blue','LineWidth',2),axis([-1 1 -0.2 1.2]);
    hold on; plot(t,y2,'Color','red', 'LineWidth',2),axis([-1 1 -0.2 1.2]);
    
    
    crossCorrelation(i) = sum(y1.*y2);
    
    subplot(4,2,5:6)
    hold off
    plot(iterationSteps(1:i),crossCorrelation(1:i),'Color','black','LineWidth',2); axis([1 iteration -100 3.1e3]);
    xlabel('t')
    ylabel('CrossCorrelation(y1, y2)(t) ')
    
    pause(0.05)
end


disp('Press Enter to continue ....')
pause


% ========== convolution of y1 and y2:
disp(' ');disp(' ')
disp('Convolution of two signals (y1 and y2):')
disp('============================================================')

for i = 1:iteration
    
    moveStep = (i-100)/100;
    %y1=gauspuls(t,1);
    y1 = rectpuls(t,1);
    y2 = tripuls(-(t-moveStep),0.5,-1);
    
    subplot(4,2,3:4)
    hold off;plot(t,y1,'Color','blue','LineWidth',2),axis([-1 1 -0.2 1.2]);
    hold on; plot(t,y2,'Color','red' ,'LineWidth',2),axis([-1 1 -0.2 1.2]);
    
    
    convolution(i) = sum(y1.*y2);
    
    subplot(4,2,7:8)
    hold off
    plot(iterationSteps(1:i),convolution(1:i),'Color','black','LineWidth',2); axis([1 iteration -100 3.1e3]);
    xlabel('t')
    ylabel('(y1 * y2)(t) ')
    
    pause(0.05)
end

