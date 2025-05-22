% dsp08_ex_iir_matlab.m
clear; close all;
fpr=2000; f1=400; f2=600; N=8; Rp=3; Rs=100; % 1) filter design requirements
[b,a] = ellip(N, Rp, Rs, [f1,f2]/(fpr/2), 'stop'); % 2) filter design
%[b,a] = butter(N, [f1,f2]/(fpr/2), 'stop');

Npunkt=1000; freqz(b,a,Npunkt,fpr); % 3) verification of filter H(f)
Nx=1000; dt=1/fpr; t=dt*(0:Nx-1); fx1=10; fx2=500; % 4) signal parameters
x = sin(2*pi*fx1*t) + sin(2*pi*fx2*t); % 5) signal generation
y = filter(b,a,x); % 6) signal filtration - two sums
figure; plot(t,x,'b-',t,y,'r-'); title('We/Wy');