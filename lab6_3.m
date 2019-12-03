% Example Two-Stage Decimator Design using IFIR Method
%
clc
clearvars
close all
%
% Specification
%
M   = 30;                       % Decimation factor
Fp  = 180;                      % Passband-edge frequency
Fst = 200;                      % Stopband-edge frequency
FT  = 12000;                    % Sampling frequency
deltap = 0.002;
deltas = 0.001;
% Convert to relative specs (in dB)
[Ap,As] = delta2db(deltap,deltas);
%
% Decimator Design
%
hf = fdesign.decimator(M,'lowpass',Fp,Fst,Ap,As,FT);
hd = design(hf,'ifir');
%
hd1 = design(hf,'equiripple');
%
hd2 = design(hf,'multistage','SystemObject',true);
% Plot and Costs
%
hfvt = fvtool(hd,hd1,hd2,'DesignMask','on','Color','White');
legend(hfvt, 'Two-stage decimator design using IFIR design method',...
    'Two-stage decimator design using equiripple design method',...
    'Two-stage decimator design using multistage design method');   
info(hd); cost(hd)
info(hd1); cost(hd1)
info(hd2); cost(hd2)
% Implementation details see hd.Stage(1) and hd.Stage(2), or realizemdl(hd)
%

% Plot and Costs

%legend(hfvt, 'Two-stage decimator design using equiripple design method');  
%info(hd); cost(hd)
% EOF