clc
clear
close all

fs=8000;
ts=1/fs;
N=8;
n=0:N-1;
x=sin(2*pi*1000*n*ts) + 0.5*sin(2*pi*2000*n*ts + 3*pi/4);
figure (1)
subplot(2,1,1)
plot(n,x);
X = zeros(N,1);%per X(0)(0) is initialized to  0;0;0;0;0N
X;
for m = 1:N
    for n = 1:N
        X(m) = X(m) + x(n)*exp(-2j*pi*(n-1)*(m-1)/N);
    end
end
% disp(X)
n=0:N-1;
figure (2)
subplot(3,2,1);
stem(n,imag(X))
title('X(m) imaginary')
subplot(3,2,2);
stem(n,real(X))
title('X(m) real')
subplot(3,2,3);
stem(n,abs(X))
title('Magnitude')
y = abs(X).^2/N;
subplot(3,2,4);
stem(n,y)
title('Power Spectrum')

a = round(imag(X),3);
b = round(real(X),3);
s = atan(a/b);
subplot(3,2,5);
stem(n,rad2deg(s));
title('Phase Spectrum')

% %idft
ln=length(X);
x=zeros(1,ln);

for i=1:ln
    for n=1:ln
        x(i)=x(i)+((1/ln)*X(n)*exp(2*pi*j*(i-1)*(n-1)/ln));
    end
end

n=0:N-1;
figure (3)
subplot(2,1,2);
plot(n,real(x));
