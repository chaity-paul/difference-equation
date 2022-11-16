clc
close all
fs = 8000;
ts = 1 / fs;
N = 8;
n = 0 : N - 1;
x = sin(2 * pi * 1000* n * ts) + 0.5 * sin(2 * pi * 2000 * n * ts + 3 * pi / 4);

X = MyDFT(x, N);
Y = MyIDFT(X, N);

% disp(x);
% disp(Y);
subplot(3, 1, 1)
stem(n, x);
title('Input Signal');

subplot(3, 1, 2)
stem(n, abs(X));
title('DFT Signal');

subplot(3, 1, 3)
stem(n, Y);
title('IDFT Signal');