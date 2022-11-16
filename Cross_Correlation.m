clc
close all
x = input('Enter the 1st input signal : ');
H = input('Enter the 2nd input signal : ');
h = fliplr(H);
n1 = length(x);
n2 = length(h);
m = n1 + n2 -1;
xn = [x, zeros(1, n2 - 1)];
hn = [h, zeros(1, n1 - 1)];
yn = zeros(1, m);

for i = 1 : m
    for j = 1 : i
        yn(i) = yn(i) + xn(j) * hn(i - j + 1);
    end
end

subplot(3, 1, 1);
title('Cross Correlation');
hold on 
stem(x);
hold off
xlabel('n');
ylabel('y[n]');

subplot(3, 1, 2);
hold on 
stem(h);
hold off
xlabel('n');
ylabel('y[n]');

subplot(3, 1, 3);
hold on 
stem(yn);
hold off
xlabel('n');
ylabel('y[n]');
