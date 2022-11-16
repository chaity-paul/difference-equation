clc
clear
close all
fs = 8000;
ts = 1/fs;
N = 8;
n = 0 : N - 1;
x = sin(2 * pi * 1000* n * ts) + 0.5 * sin(2 * pi * 2000 * n * ts + 3 * pi / 4);

X = myDFT(x, N);
Y = myIDFT(X, N);

figure(1)
subplot(2,1,1)
plot(n, x);
title('Original Signal');

figure(2)
n = 0 : N - 1;
subplot(3,2,1)
stem(n, imag(X));
title('Imaginary');

subplot(3,2,2)
stem(n, real(X));
title('Real');

subplot(3,2,3);
stem(n, abs(X));
title('Magnitude');

y = abs(X).^2/N;
subplot(3,2,4);
stem(n, y);
title('Power Spectrum');

a = round(imag(X),3);
b = round(real(X),3);
s = atan(a/b);
subplot(3,2,5);
stem(n,rad2deg(s));
title('Phase Spectrum');

figure(3)
subplot(2,1,1)
plot(n, real(Y));
title('IDFT');