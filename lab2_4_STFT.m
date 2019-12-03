clc;
clearvars;
close all
%Sampling Frequency
FS = 1000; 
%Chirp Signal
t = 0:1/1000:1;
X1 = chirp(t,0,1,500);
X2 = chirp(t,50,1,450);
Y = [X1 X2]; 
Z = X1 + X2;

player1 = audioplayer(Y,FS);
play(player1)
figure(4)
subplot(3,1,1)
plot(t,X1);
subplot(3,1,2)
plot(t,X2);
subplot(3,1,3)
plot(t,Z);

N = 2^14;

Z= X1 + X2;
output = fft(Z, N);
mag = abs(output);
f_ax = FS/N*[1:N];
figure
plot(f_ax, mag);
title('DFT for the superposition of two chirp signals');

win_lgth = 64; 
L = 8;
overlap = win_lgth - L;
figure(6)
spectrogram(Z, win_lgth, overlap, N, FS,'yaxis');
title('Spectrogram');