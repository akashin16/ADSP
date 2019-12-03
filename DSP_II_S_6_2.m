% DSP_II_S_6_2
% Down- and Up-Sampling in the Frequency-Domain
clc
clearvars
close all
%
%% Input spectrum
freq = [0 0.42 0.48 1];
mag = [0 1 0 0];
x = fir2(101,freq,mag);
[Xz,w] = freqz(x,1); 
%
%% Down-Sampling
y1 = downsample(x,2);           % Down-sampling by M = 2
[Yz1,w1] = freqz(y1,1);
y2 = downsample(x,3);           % Down-sampling by M = 3
[Yz2,w2] = freqz(y2,1);   
%
%% Up-Sampling
y3 = upsample(x,5);             % Up-sampling by L = 5
[Yz3,w3] = freqz(y3,1);
%
%% Plots
subplot(231)
plot(w/pi,abs(Xz),'LineWidth',2); grid
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Input spectrum');
subplot(232)
plot(w1/pi, abs(Yz1),'LineWidth',2,'Color','r'); grid
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Output spectrum for M = 2');
subplot(233)
plot(w2/pi, abs(Yz2),'LineWidth',2,'Color','k'); grid;
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Output spectrum for M = 3');
subplot(2,3,4:6);
plot(w3/pi, abs(Yz3),'LineWidth',2,'Color','m'); grid
xlabel('\omega/\pi'); ylabel('Magnitude');
title('Output spectrum for L = 5');
% EOF