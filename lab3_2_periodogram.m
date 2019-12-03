%  Periodogram 
clc
clearvars
close all
% Input
L = input('Window Length L = ');
R = input('FFT R = ');
% signal generation
n = 0:L-1;
randn('state',0);
X = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1,L);

window = rectwin(L);
[Period_PSD,W] = periodogram(X,window,R);



line(W/pi,10*log10(Period_PSD),'LineWidth',2); 
ylim([-30 20]); 
xlim([0 1]);
grid on;
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('Periodogram Power Spectral Density Estimate');

str = ['L = ', num2str(L), 'R = ', num2str(R)];
text([0.25 14],[0.3 20],str);