clear all
close all
clc
G=1;

SOS=[1.0000000, 2.0000000, 1.0000000, 1.0000000, -0.6762858, 0.3917468]; 
hd = dfilt.df2sos(SOS,G);
set(hd, 'Arithmetic', 'fixed');
[L2_norm]=cascadescale(SOS,2);
%disp('L2_norm');
%disp(L2_norm);


 %L2=scale(hd,'l2');
% fvtool(hd);
% realizemdl(hd);
 %disp(L2);
