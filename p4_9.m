% Problem 4_9

N = 2000; fs = 2000;
dt = 1/fs;
t = (0:N-1)*dt;
f = (0:N-1)*fs/N;
x = sin(2*pi*50*t);
y = kaiser(N, 15);
X = fft(x);
Y = fft(y);

% ---------------------------------------------
% spectrum of kaiser window

figure;
subplot(211); plot(abs(Y),'bo-'); title('|Y(f)|'); grid;
subplot(212); plot(angle(Y),'bo-'); title('phase(Y(f))'); grid;
pause

% ---------------------------------------------
% spectrum of sine

figure;
subplot(211); plot(f, abs(X), 'bo-'); title('|X(f)|'); grid;
subplot(212); plot(unwrap(angle(X)), 'bo-'); title('phase(X(f))'); grid;
pause

% ---------------------------------------------
% convolution

x1 = conv(x,y);
X1 = fft(x1);

figure;
plot((0:2*N-2)*fs/N, abs(X1), '-o'); title('|DFT{conv(x,y)}|'); grid;
pause

% ---------------------------------------------
% correlation

x2 = xcorr(x,y);
X2 = fft(x2);

figure;
plot((0:2*N-2)*fs/N, abs(X1), '-o'); title('|DFT{corr(x,y)}|'); grid;
pause

% ---------------------------------------------
% derivative

x3 = diff(x)./diff(t);
x3(2000) = x(2000)-x(1999);
X3 = fft(x3);

figure;
plot(f, abs(X3), '-o'); title('|DFT{dx(t)/dt}|'); grid;
pause

% ---------------------------------------------
% time scaling

t4 = 4*t;
x4 = sin(2*pi*50*t4);
X4 = fft(x4);

figure;
plot(f, abs(X4), '-o'); title('|DFT{x(4t)}|'); grid;
pause

% ---------------------------------------------
% time reverse

x5 = -x;
X5 = fft(x5);

figure;
plot(f, abs(X5), '-o'); title('|DFT{x(-t)}|'); grid;
pause


