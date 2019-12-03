N1=32;
N2=128;
R=32;
n=0:1:R-1;
K1=0:1:N1-1;
K2=0:1:N2-1;
FS1=64;%sampling rate 64 Hz
FS2=24;
TS2=1/FS2;
TS1=1/FS1;
f=10; %Frequency of sinusoid 
W=ones(1,R);
X=cos(2*pi*f*TS1*n);
A=cos(2*pi*f*TS2*n);
X1=X.*W;
A1=A.*W;
Y=fft(X1);
B=fft(A1);
C=[A , zeros(1,N2-N1)];
D=fft(C);
figure
subplot(2,2,1);
stem(K1,Y);
ylim([0 31]);
grid on

title('DTFT 1');
ylabel('Y(K)');
xlabel('K');


subplot(2,2,2);
stem(K1,abs(B));
ylim([0 31]);
grid on
title('DTFT 2');
ylabel('B(K)');
xlabel('K');

subplot(2,2,[3,4]);
%ylim([0 31]);
ylim([0 127]);
stem(K2,abs(D));
grid on
title('DTFT 3');
ylabel('D(K)');
xlabel('K');

