
clc
clearvars
close all
%

n = -1.5:0.00001:1.5;   
signal = n;
wl = 5;                
figure(4);

%Round and Sat
xq = twosquant(signal, wl, 'r', 's');
e = signal - xq;
subplot(221)
grid;
hold on;
stairs(n,signal,'b');
stairs(n,xq,'k','LineWidth',2);
stairs(n,e,'r','LineWidth',2);
axis([-1.5 1.5 -1.5 1.5]);
xlabel('x'); ylabel('x,Q(x),e');
title('Rounding and Saturation','FontSize', 12);
legend('Input ','Q(signal)','Error(e)','Location','NorthWest');

% Round and Of
xq = twosquant(signal, wl, 'r', 'o');
e = signal - xq;
subplot(222)
grid; hold on;
stairs(n,signal,'b');
stairs(n,xq,'k','LineWidth',2);
stairs(n,e,'r','LineWidth',2);
axis([-1.5 1.5 -2.5 2.5]);
xlabel('x'); ylabel('x,Q(x),e');
title('Rounding and Overflow','FontSize', 12);
legend('Input ','Q(signal)','Error(e)','Location','NorthWest');

%Trun and Sat
xq = twosquant(signal, wl, 't', 's');
e = signal - xq;
subplot(223)
grid; hold on;
stairs(n,signal,'b');
stairs(n,xq,'k','LineWidth',2);
stairs(n,e,'r','LineWidth',2);
axis([-1.5 1.5 -1.5 1.5]);
xlabel('x'); ylabel('x,Q(x),e');
title('Truncation and Saturation', 'FontSize', 12);
legend('Input ','Q(signal)','Error(e)','Location','NorthWest');

%Trun and Of
xq = twosquant(signal, wl, 't', 'o');
e = signal - xq;
subplot(224)
grid; hold on;
stairs(n,signal,'b');
stairs(n,xq,'k','LineWidth',2);
stairs(n,e,'r','LineWidth',2);
axis([-1.5 1.5 -2.5 2.5]);
xlabel('x'); ylabel('x,Q(x),e');
title('Truncation and Overflow','FontSize', 12);
legend('Input ','Q(signal)','Error(e)','Location','NorthWest');
