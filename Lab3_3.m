clc
clearvars
close all
% Length of window and FFT length
N = input(' Data Length N =');
L = input('Window Length L  = ');
R = input(' FFT Lenght R = ');
% Signal generation
n = 0:N-1;
randn('state',0);
X = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1,length(n));
% Window and Periodogram
RXX=xcorr(X,'biased');

window =bartlett(2*L-1);
windzeropadding = [zeros(1,N-L),window',zeros(1,N-L)];  
X1=RXX.*windzeropadding;
BL_PSD=abs(fft(X1,R));
W = 0:2*pi/R:2*pi*(1-1/R);
line(W/pi,10*log10(BL_PSD),'LineWidth',2); 
ylim([-50 30]);
xlim([0 1]);
grid on;
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('Blackman Tukey PSD estimate ');

str = ['N = ', num2str(N), 'L = ', num2str(L),'R = ',num2str(R)];
text([0.1 100],[0.1 100],[0.1 100],str);

