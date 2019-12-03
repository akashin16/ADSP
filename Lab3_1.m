clear
randn('state',0);
N=100;
X=randn(1,N); % AWGN noise 
R=1024;
[RB,LB]=xcorr(X,'biased');
BIAS=xcorr(X,'biased');
[RUB,LUB]=xcorr(X,'unbiased');
figure(3)
subplot(2,2,1)
stem(LB,RB);
xlabel('Lag');
ylabel('Correlation biased');

subplot(2,2,2)
stem(LUB,RUB);
xlabel('Lag');
ylabel('Correlation unbiased');



subplot(2,2,3:4);
BPSD=abs(fft(RB,R));
W = 0:2*pi/R:2*pi*(1-1/R);
line(W/pi,10*log10(BPSD)); 
ylim([-50 30]);
xlim([0 1]);
grid on;
xlabel('Normalized Frequency  (\times\pi rad/sample)');
ylabel('Power/frequency (dB/rad/sample)');
title('PSD ');
hold on;

UBPSD=abs(fft(RUB,R));
line(W/pi,10*log10(UBPSD),'color',[1 0 0]); 
legend('Biased','Unbiased');


r=16;
k=1:r-1;
std_bias=zeros(1,r-1);
std_unbias=zeros(1,r-1);

for K=1:r-1
    std_bias(K)=(r-K)/R^2;
    std_unbias(K)=1/(r-K);
end

figure
plot(k,std_bias,k, std_unbias, 'Linewidth', 2);
hold on 
grid on
title('Normalised Variance');
xlabel('k');
ylabel('Amp');
legend('biased ACS', 'unbiased ACS');




