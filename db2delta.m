function [deltap,deltas] = db2delta(alphap,alphas)
% Conversion from relative dB specs to absolute specs
% deltap = Passband ripple (1 +/- deltap)
% deltas = Minimum stopband attenuation
% alphap = Peak passband ripple in dB
% alphas = Minimum stopband attenuation in dB
% ---------------------------------------------------
K = 10^(alphap/20);
deltap = (K-1)/(K+1);
deltas = (1+deltap)*(10^(-alphas/20));
% EOF