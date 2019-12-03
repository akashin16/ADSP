%kaiser Window
Asl1=input('enter the Asl(db)');
if(Asl1<13.26)
    beta= 0;
else if(13.26<=Asl1)&&(Asl1<60)
        beta=0.76609*(Asl1-13.26)^0.4+0.09834*(Asl1-13.26);
    else
        beta=0.12438*(Asl1+6.3);
    end
end
F1=1/14;
F2=2/15;
deltaw1=2*pi*(F2-F1);
L1=((24*pi*(Asl1+12))/(155*deltaw1))+1;
R=2^ceil(log2(L1));
N=R;
n=0:R-1;
alpha=(L1-1)/2;
X=(cos((2*pi/14).*n))+0.1.*sin((4*pi/15).*n);
%Z=sqrt(beta*(1-((n-alpha)/alpha).^2));
%WK= besseli(X,n)/besseli(alpha);
WKfunc= kaiser(N,beta);
XK1=transpose(fft(WKfunc.*X',R));
XR1=transpose(fft(rectwin(R).*X',R));
figure
subplot(1,2,1);
stem(n,abs(XR1));
title('rectangular window');
xlabel('k');
ylabel('XR');
grid on ;

subplot(1,2,2);
stem(n,abs(XK1));
title('Kaiser window');
xlabel('k');
ylabel('XK');
grid on ;
wvtool(WKfunc);
