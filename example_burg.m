% Burg Method
% INPUT 
N = input('Type in the data length N = ');
P = input('Type in the order P = ');
randn('state',0);
n = 0:N-1;
x = 2*sin(0.06*pi*n) + sin(0.14*pi*n) + randn(1,N);
nfft = 2048;
%
%% PSD computation using burgalg
% burgalg is a user-defined function for the Burg algorithm
[a,k,v] = burgalg(x,P);
% a = AR parameter, k = reflection coefficients, v = variance
[Pxx,w] = freqz(v,a,nfft);
plot(w/pi,20*log10(abs(Pxx))); grid;
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('Burg Power Spectral Density Estimate using burgalg');
text('String', ['N = ', num2str(N), ...
     ', P = ', num2str(P)], ...
     'Position', [0.4 max(10*log10(Pxx))*0.5], ...
     'FontSize', 14, 'Color', [1 0 0]);
% 
%% ### Check the results of burgalg using arburg and pburg ###
% AR model
[arcoef,errvar,kcoef] = arburg(x,P);
disp(['norm(a-arcoef) = ', num2str(norm(a-arcoef))]);
disp(['norm(k-kcoef) = ', num2str(norm(k-kcoef))]);
disp(['v-errvar = ', num2str(v-errvar)]);
% PSD estimate
[Pxx,w] = pburg(x,P);
figure(2); 
pburg(x,P,nfft);
title('Burg Power Spectral Density Estimate using pburg');
% EOF