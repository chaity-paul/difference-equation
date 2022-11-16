clc
close all;

x_cof = [0.25, 0.25];
len_x_cof = length(x_cof);
y_cof = [1, -0.50];
len_y_cof = length(y_cof);
x = [1 1 1 1 1];
l = length(x);
initial_con = [];

x_cof = [x_cof, zeros(1, l - len_x_cof)];
y_cof = [y_cof, zeros(1, l - len_y_cof)];
y = zeros(1, l);
for i = 1 : length(initial_con)
        y(i) = initial_con(i);
end
for n = length(initial_con) + 1 : l
    x_sum = 0;
    y_sum = 0;
    for i = 2 : n
        y_sum = y_sum + (y_cof(i) * y(n - i + 1));
    end
    for i = 1 : n
        x_sum = x_sum + (x_cof(i) * x(n - i + 1));
    end
    y(n) = (x_sum - y_sum)/y_cof(1);
end
disp(y);
stem(y);
