clc
clear all
close all
N=12;
M=5;
wo=2*pi/19;
w=2*pi/10;
W=exp(-1j*w);
X = fir1(11,125/500,rectwin(12));
k1=0:N-1;
k2=-N+1:M-1;
k3=0:M-1;
R1=exp(-1j*wo*(k1)).*(exp(-1j*w*(k1.^2)/2));
G=X.*R1;
H=W.^(-(k2.^2/2));
D=W.^((k3.^2)/2);
Y1=conv(G,H);
Y=Y1(N:N+M-1).*D
output_czt=czt(X,M,W,exp(1j*wo))