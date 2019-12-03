%  Yule-Walker 
clc
clearvars
close all
% Input
N = input('Data Length N = ');
P = input(' P = ');
n = 0:N-1;
randn('state',0);
X = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1, length(n));
% AR model 
%a = aryule(X,P);
%fvtool(1,a);
% PSD estimate
[YW_PSD,W] = pyulear(X,P);
% Plot


line(W/pi,10*log10(YW_PSD),'LineWidth',2); 
ylim([-20 20]);
xlim([0 1]); 
grid on;
xlabel('Normalized Frequency (\times\pi rad/sample) ');
ylabel('Power/frequency (dB/rad/sample)');
title('Yule-Walker PSD estimate');
str = ['N = ', num2str(N), 'P = ', num2str(P)];
text([0.25 14],[0.3 20],str);
