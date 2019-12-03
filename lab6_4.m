% Example for the design of 3-band filters
clc
clearvars
close all
%
% 1. Design of a 4-band filter with fdesign.nyquist
l = 4;          % number of bands
n = 34;         % filter order
ast = 60;      % stopband attenuation
hs = fdesign.nyquist(l,'n,ast',n,ast);
hd = design(hs,'kaiserwin','SystemObject',true); % using a kaiser window


% 2. Design of a 4-band filter with firnyquist (equiripple characteristic)
n = 34;          % filter order (must be even)
l = 4;           % number of bands
r = 0.33;        % rolloff factor r, must satisfy 0 < r < 1
dev=0.05;
% r is related to the normalized transition width tw by tw = 2*pi*r/l,
% i.e. the greater r the greater the bandwidth
h = firnyquist(n,l,r,dev);
%

%
% Analysis in FV tool
hfvt = fvtool(h,1,hd);
legend(hfvt,'4-band filter designed with firnyquist', ...
  '4-band filter designed with fdesign.nyquist and kaiser window');


% EOF