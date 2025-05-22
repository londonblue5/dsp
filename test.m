clear; close all;

% DCT
N = 100;
n = (0:N-1)';
k = (0:N-1)';
S = 1/sqrt(N)*exp(1i*2*pi/N*n*k');
A = conj(S');
x = 1/sqrt(N)*cos(2*n);
c = A*x;
subplot(211); plot(n, x); title("x(n)");
subplot(212); plot(k, abs(c)); title("|c(k)|");
