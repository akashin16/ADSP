% % filter poles and zeros
% clc
% clearvars
% close all
% 
% Fs = 2000;
% Fpass = 510;
% Fstop = 500;
% Apass = 1.0;
% Astop = 60;
% wp= (2*pi*Fpass)/Fs;
% ws= (2*pi*Fstop)/Fs;
%  
% [n,Wp] = ellipord(0.51,0.5,Apass,Astop);
% hd=ellip(n,Apass,Astop,Wp);
% Hd = dfilt.df2(hd);
% set(Hd,'Arithmetic', 'fixed', ...  
%     'CoeffWordLength',4, ...    
%     'RoundMode',...
%     'convergent', ... 
%     'OverflowMode', 'Wrap');
% 
% zplane(Hd);
% hold on
% 
% 
% % Filter design using fixed point format
% % K=1;
% % L=1;
% % Num=[1 0 0];
% % Den=[1 -K L];
% % hd = tf(Num,Den); 

% 
% 
% fvtool(Hd);
zplane([],[]);
stepsize = 2^-3;
for k=-2:stepsize:2
    for l=-1:stepsize:1
       r=[1 -k l];
       p=roots(r);
       hold on,
       plot(real(p),imag(p),'*');
    end
end

