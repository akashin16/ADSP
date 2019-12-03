
clc
clearvars
close all

fs = 4000;
T = 1 / fs;
t = 0: T: 0.5;
% Frequency vector
fNote = [524 588 660 698 784 880 988];
Do = sin (2 * pi * fNote (1) * t + 2 * pi * rand); % C
Re = sin (2 * pi * fNote (2) * t + 2 * pi * rand); % D
Mi = sin (2 * pi * fNote (3) * t + 2 * pi * rand); % E
Fa = sin (2 * pi * fNote (4) * t + 2 * pi * rand); % F
So = sin (2 * pi * fNote (5) * t + 2 * pi * rand); % G
La = sin (2 * pi * fNote (6) * t + 2 * pi * rand); % A
Ti = sin (2 * pi * fNote (7) * t + 2 * pi * rand); % B
% Weighting of grades
expWtCnst = 6;
expWt = exp (-abs (expWtCnst * t));
Do = Do.* expWt;
Re = Re.* expWt;
Mi = Mi.* expWt;
Fa = Fa.* expWt;
So = So.* expWt;
La = La.* expWt;
Ti = Ti.* expWt;
%% scale
noteSequence = [Do Re Mi Fa So La Ti];
% soundsc (noteSequence, fs)
player1 = audioplayer (noteSequence, fs);
play (player1)
N = 2^14;
INPUT= Do + Re + Mi + Fa + So + La + Ti;
output = fft(INPUT, N);
mag_fft=abs(output);
f_ax = fs/N*[1:N];
figure(2)
subplot(2,1,1)

plot(f_ax, mag_fft);
xlim([0 2000]);
title('Magnitude Spectrum using DFT');

L =32;
win_lgth = 2000; 

overlap = win_lgth - L;
subplot(2,1,2)
spectrogram(noteSequence, win_lgth, overlap, N, fs,'yaxis');
title('Spectrogram');
% EOF