% DSP_II_S_6_5
% Fractional Sampling Rate Converter Design
%
clc
clearvars
close all
%
%% Specification
L = 3;          % Interpolation factor
M = 2;          % Decimation factor
Np = 3;         % 3rd-order Lagrange polynomials
Fs = 1;         % Original sampling frequency
%
%% Fractional sampling rate converter design using fdesign.polysrc
f = fdesign.polysrc(L,M,'Fractional Delay','Np',Np,Fs);
Hm = design(f,'lagrange');
hfvt = fvtool(Hm,'Analysis','Info');
%
%% Simulation
fa = 0.05;              % Sinusoid at 0.05 Hz
Fs = 1;                 % Original sampling frequency
n = 0:30;               
Ln = length(n);
x = sin(2*pi*fa/Fs*n);  % Original signal
y = filter(Hm,x);       % Interpolated signal
% Plots
figure;
subplot(211)
stem(n,x,'LineWidth',2); grid;                  % Original signal
xlabel('Time index n'); ylabel('Amplitude')
title('Input sinusoidal sequence with 1 Hz sampling rate')
subplot(212)
stem(0:Ln+Np-1,y(1:Ln+Np),'r','LineWidth',2)    % Converted signal
axis('tight'); grid;
xlabel('Time index n'); ylabel('Amplitude')
title('Interpolator output with 3/2 Hz sampling rate')
%
%% Lagrange Polynomials and FIR Transfer Functions of the Farrow Structure
p1 = lagrange_poly(-2:1,1); % P-2
p2 = lagrange_poly(-2:1,2); % P-1
p3 = lagrange_poly(-2:1,3); % P0
p4 = lagrange_poly(-2:1,4); % P+1
%
%% Block matrix
a0 = 0; 
a1 = 2/3; 
a2 = 4/3;
% P-2(a0), P-2(a1), P-2(a2)
p1_a0 = p1(1)*a0^3 + p1(2)*a0^2 + p1(3)*a0 + p1(4);
p1_a1 = p1(1)*a1^3 + p1(2)*a1^2 + p1(3)*a1 + p1(4);
p1_a2 = p1(1)*a2^3 + p1(2)*a2^2 + p1(3)*a2 + p1(4);
% P-1(a0), P-1(a1), P-1(a2)
p2_a0 = p2(1)*a0^3 + p2(2)*a0^2 + p2(3)*a0 + p2(4);
p2_a1 = p2(1)*a1^3 + p2(2)*a1^2 + p2(3)*a1 + p2(4);
p2_a2 = p2(1)*a2^3 + p2(2)*a2^2 + p2(3)*a2 + p2(4);
% P0(a0), P0(a1), P0(a2)
p3_a0 = p3(1)*a0^3 + p3(2)*a0^2 + p3(3)*a0 + p3(4);
p3_a1 = p3(1)*a1^3 + p3(2)*a1^2 + p3(3)*a1 + p3(4);
p3_a2 = p3(1)*a2^3 + p3(2)*a2^2 + p3(3)*a2 + p3(4);
% P1(a0), P1(a1), P1(a2)
p4_a0 = p4(1)*a0^3 + p4(2)*a0^2 + p4(3)*a0 + p4(4);
p4_a1 = p4(1)*a1^3 + p4(2)*a1^2 + p4(3)*a1 + p4(4);
p4_a2 = p4(1)*a2^3 + p4(2)*a2^2 + p4(3)*a2 + p4(4);
% Block matrix
H = [p1_a0 p2_a0 p3_a0 p4_a0; ...
     p1_a1 p2_a1 p3_a1 p4_a1; ...
     p1_a2 p2_a2 p3_a2 p4_a2];
disp('Block matrix:'); disp(H);
%
%% Transfer functions of the Farrow structure
H0 = [p1(1) p2(1) p3(1) p4(1)];
H1 = [p1(2) p2(2) p3(2) p4(2)];
H2 = [p1(3) p2(3) p3(3) p4(3)];
H3 = [p1(4) p2(4) p3(4) p4(4)];
disp('Transfer functions of the Farrow structure:');
disp('H0 = '); disp(H0);
disp('H1 = '); disp(H1);
disp('H2 = '); disp(H2);
disp('H3 = '); disp(H3);
% EOF