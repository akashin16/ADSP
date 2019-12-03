function [alphap,alphas] = delta2db(deltap,deltas)
% Conversion from absolute specs to relative dB specs
% deltap = Passband ripple (1 +/- deltap)
% deltas = Minimum stopband attenuation
% alphap = Peak passband ripple in dB
% alphas = Minimum stopband attenuation in dB
% ---------------------------------------------------
alphap = 20*log10((1+deltap)/(1-deltap));
alphas = 20*log10((1+deltap)/deltas);
% EOF