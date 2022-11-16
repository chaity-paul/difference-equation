clc;
clear;
close all;
fs = 500;
f = 10;
n = 0 : 1/fs : 1;
%original signal
x = sin(2 * pi * f * n);
subplot(4,1,1)
plot(n, x);
title('x(n) Signal')
%noise
y = rand(1, length(x));
%noisy signal
z = x + y;
subplot(4, 1, 2)
plot(n, z);
title('Noisy Signal');
xlabel('Time(s)');
ylabel('Amplitude');

%Spectral analysis of signal
l=length(z);
nfft=2^nextpow2(l);
z_fft=abs(fft(z,nfft));
freq=fs/2*linspace(0,1,nfft/2+1);
subplot(4,1,3)
plot(freq,z_fft(1:length(freq)));
title('Single sided amplitude spectrum of z(t)');
xlabel('Frequency')

%Design filter, Butterworth 8 - 12 Hz
o = 5; %Order;
wn = [8 12]*2/fs; %cutoff frequecy
[b, a] = butter(o, wn, 'bandpass');
filt = filter(b, a, z);
subplot(4, 1, 4)
plot(n, filt);
title('Filtered Signal')
xlabel('time(s)');
ylabel('Amplitude');
