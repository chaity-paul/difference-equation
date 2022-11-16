clc
clear 
close all;
N = 16;
n = 0 : N - 1;
x = [1 1 2 2 3 3 4 4 0 0 0 0 0 0 0 0 0];

X = MyDFT(x, N);
Y = zeros(N, 1);

subplot(2, 1, 1)
stem(n, abs(X));
title('Symmetry Property');
xlabel('Time');
ylabel('Amplitude');

    for k = 0 : N - 1
        Y(k + 1) = Y(k + 1) + X(k + 1) * exp(-1i*2*pi*2*k/N);
    end

y = MyIDFT(Y, N);
subplot(2, 1, 2)
stem(n, y);
title('Time Shift Property');
xlabel('Time');
ylabel('Amplitude');

