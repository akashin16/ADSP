% DSP_II_S_6_1
% Down- and Up-Sampling in the Time-Domain
clc
clearvars
close all
%
%% Continuous-Time Signal and Sampling
f0 = 2;                     % analogue frequency
t = linspace(0,2,200);      % time axis
xa = 2*cos(f0*2*pi.*t);     % continuous-time signal
fs = 16;                    % sampling frequency
T = 1/fs;                   % sampling period
n = t(1):T:t(end);          % discrete time values
x = 2*cos(f0*2*pi*n);
figure;
subplot(211)
plot(t,xa,'--m');
hold on
stem(n,x,'MarkerFaceColor','b');
xlabel('Time in s'); ylabel('Amplitude');
legend('continuous-time signal', 'discrete-time signal');
title('Continuous-time and discrete-time signal');
%
%% Down-sampling and up-sampling
M = 2;                    % down sampling factor
L = 3;                    % up sampling factor
xd = downsample(x,M);     % down-sampled Signal
nd = t(1):M*T:t(end);
xu = upsample(x,L);       % up-sampled Signal
nu = t(1):T/L:t(end);
%
%% Plots
subplot(212)
stem(nd,xd,'MarkerFaceColor','r');
hold on
stem(nu,xu(1:end-(L-1)),'k');
legend('Down sampled signal','Up sampled signal');
xlabel('Time in s'); ylabel('Amplitude');
title('Sampling Rate Conversion');
% EOF