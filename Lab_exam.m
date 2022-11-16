clc
close all;
f1 = 5;
f2 = 10;
t = 0 : 0.01 : 1;
x1 = sin(2 * pi * f1 * t);
x2 = sin(2 * pi * f2 * t);

%for cross correlation
h = fliplr(x2);
n1 = length(x1);
n2 = length(h);
m = n1 + n2 -1;
xn = [x1, zeros(1, n2 - 1)];
hn = [h, zeros(1, n1 - 1)];
yn = zeros(1, m);

for i = 1 : m
    for j = 1 : i
        yn(i) = yn(i) + xn(j) * hn(i - j + 1);
    end
end

%for auto correlation
H = fliplr(x1);
N1 = length(x1);
N2 = length(H);
M = N1 + N2 -1;
Xn = [x1, zeros(1, N2 - 1)];
Hn = [H, zeros(1, N1 - 1)];
Yn = zeros(1, M);

for i = 1 : M
    for j = 1 : i
        Yn(i) = Yn(i) + Xn(j) * Hn(i - j + 1);
    end
end

lag1 = -(n2 - 1) : 1 : n1 - 1;
lag2 = -(N2 - 1) : 1 : N1 - 1;

subplot(4,1,1)
hold on
plot(t, x1);
hold off
xlabel('x(t)');
ylabel('t');
title('First signal');

subplot(4, 1, 2)
hold on 
plot(t, x2);
hold off
xlabel('x(t)');
ylabel('t');
title('Second signal');

subplot(4, 1, 3)
hold on 
plot(lag2,Yn);
hold off
xlabel('x(t)');
ylabel('t');
title('Auto Correlation');

subplot(4, 1, 4)
hold on 
plot(lag1, yn);
hold off
xlabel('x(t)');
ylabel('t');
title('Cross Correlation');