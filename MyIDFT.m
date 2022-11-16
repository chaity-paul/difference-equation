function X = MyIDFT(x, N)

X = zeros(1, N);
    for k = 0 : N - 1
        for n = 0 : N - 1
            X(k + 1) = X(k + 1) + (1 / N) * x(n + 1) * exp(1i*2*pi*k*n/N);
        end
    end
end
