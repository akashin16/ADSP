clear all
close all
clc
G=1;
B=13;
L=12;
SOS=[0.0662272, 0.0662272,0.0000000,1.0000000, -0.2593284, 0.0000000;...
1.0000000, 2.0000000, 1.0000000, 1.0000000, -0.6762858, 0.3917468];
[L2_norm]=cascadescale(SOS,3);
disp('L2_norm');
disp(L2_norm);
%hd = dfilt.df2sos(SOS,G);
%set(hd, 'Arithmetic', 'fixed');

% set(hd, 'AccumMode', 'FullPrecision');
%L2=scale(hd,'l2');
% fvtool(hd);
%disp(L2);
% %l=scale(hd,'linf')
% %disp(l);

