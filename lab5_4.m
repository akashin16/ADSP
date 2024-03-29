
%DSP_II_S_5_4;
close all;
clear all;
B=13;
L=12;
d = fdesign.lowpass(0.5,0.6,1,60);
hd = design(d,'ellip');
set(hd, 'Arithmetic', 'fixed');
% 
% set(hd, 'Arithmetic', 'fixed', ... 
%      'CoeffWordLength', B, ...
%      'InputWordLength', B,...
%      'InputFracLength', L, ... 
%      'SectionInputWordLength', B, ... 
%      'SectionOutputWordLength', B, ... 
%      'StateWordLength', B, ... 
%      'StateFracLength', L, ... 
%      'OutputWordLength', B, ... 
%      'ProductMode', 'KeepMSB', ... 
%      'AccumMode', 'KeepMSB', ... 
%      'RoundMode', 'round', ... 
%      'OverflowMode', 'saturate');
hd2 = copy(hd);

Ltwo=scale(hd,'L2');
hd1=scale(reorder(hd,'up','fixed'),'L2');
fvtool(Ltwo,hd1,'analysis','noisepower');
legend('hd l2 scaled','hd l2 scaled reference','hd reordered and l2 scaled','hd reordered and l2 scaled reference');
hold on


linfinity=scale(hd2,'Linf');
hd3=scale(reorder(hd2,'up'),'Linf');
fvtool(linfinity,hd3,'analysis','noisepower');
legend('hd linf scaled','hd linf scaled reference','hd reordered and linf scaled','hd reordered and linf scaled reference');
