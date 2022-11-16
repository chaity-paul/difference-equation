%Frequecies
f1 = 4;
f2 = 8;
f3 = 16;
%Amplitudes
a1 = 10;
a2 = 20;
a3 = 40;
%time
tmin = 0;
tmax = 1;
t = linspace(tmin, tmax, 1000);
%Sinusoidal signals
x1 = a1*sin(2*pi*f1*t);
x2 = a2*sin(2*pi*f2*t);
x3 = a3*sin(2*pi*f3*t);
%Composite signal
x = x1 + x2 + x3;
%subplot(2,1,1);
plot(t, x);
xlabel('Time-->');
ylabel('Amplitude-->');
title('Composite signal');

%Sampling
Fs = 32;
Ts = 1/Fs;
nmin = ceil(tmin / Ts);
nmax = floor(tmax / Ts);
n = nmin : nmax;
x_sampled = a1*sin(2*pi*f1*n*Ts) + a2*sin(2*pi*f2*n*Ts) + a3*sin(2*pi*f3*n*Ts);
%subplot(2,1,2);
hold on
plot(n*Ts, x_sampled, '*');
hold off
