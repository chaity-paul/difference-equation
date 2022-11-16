f = 1;
fs = 40;
n = 1 : 40;
y = sin(2*pi*f/fs*n) + 2*cos(2*pi*2*f/fs*n);
b = 4;
label = 2^(b-1)-1;
max_amplitude = max(abs(y));
y_quantized = floor((y * label )/max_amplitude + 0.5);
stem(n, y_quantized);