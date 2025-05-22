clear variables; close all; clc
N = 4;                          % number of TF poles
f0 = 100;                       % cut-off frequency of low-pass filter
w0 = 2*pi*f0;                   % radial frequencies
deltaang = pi/N;                % angle of ``piece of cake''
fi = pi/2 + deltaang/2 + (0 : N-1)*deltaang;  % all angles of poles
p = w0*exp(j*fi);                % all poles

if(0)                           % LOW-PASS
  z = [];                       % no zeros
  gain = real(prod(-p));        % gain
end
if(1)
  z = zeros(1,N);               % zeros
  gain = 1;                     % gain
end  

a = poly(p);                    % poles to coeffs of polynomial of denominator A(z)
b = poly(z);                    % poles to coeffs of polynomial of nominator B(z)
f = 0:1:1000;                   % frequencies of interest
w = 2*pi*f;                     % radial frequencies
s = j*w;
H = gain*polyval(b,s) ./ polyval(a,s);               % ratio of two polynomials

[bb,ab] = butter(N,2*pi*f0,'high','s');
Hb = gain*polyval(bb,s) ./ polyval(ab,s);
figure;
semilogx(f,20*log10(abs(H)))
grid on;
hold on;
semilogx(f,20*log10(abs(Hb)))
xlabel('Frequency [Hz]')
ylabel('Amplitude [dB]')
legend('Original Filter', 'Butterworth Filter')
hold off;

ang = 0 : pi/100 : 2*pi;
cos = w0*cos(ang);
sin = w0*sin(ang);              % circle for poles
figure; 
plot(real(z),imag(z),'bo',real(p),imag(p),'r*',cos,sin,'k-');
grid on;
title('ZP');
hold on;
line([0 0], ylim, 'Color', [0.5 0.5 0.5], 'LineStyle', '--'); % y=0, dashed
line(xlim, [0 0], 'Color', [0.5 0.5 0.5], 'LineStyle', '--'); % x=0, dashed
hold off;