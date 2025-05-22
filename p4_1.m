% p4_1
N = 8;
k = (0:N-1); n = (0:N-1); % rows=functions, columns=samples
A = sqrt(1/N)*exp(-1i*2*pi/N*k'*n); % analysis matrix

t = 