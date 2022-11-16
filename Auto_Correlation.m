clc
close all
x = input('Enter the input signal : ');
h = fliplr(x);
n = length(x);
m = 2 * n -1;
xn = [x, zeros(1, n - 1)];
hn = [h, zeros(1, n - 1)];
yn = zeros(1, m);

for i = 1 : m
    for j = 1 : i
        yn(i) = yn(i) + xn(j) * hn(i - j + 1);
    end
end

subplot(2, 1, 1);
title('Auto Correlation');
hold on 
stem(x);
hold off
xlabel('n');
ylabel('y[n]');

subplot(2, 1, 2);
hold on 
stem(yn);
hold off
xlabel('n');
ylabel('y[n]');
