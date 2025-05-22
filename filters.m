% let's create a digital filter

if(0)  % choosing polynomial coefficients
   b = [3,2];                      % [ b1, b0 ]
   a = [4,3,2,1];                  % [ a3, a2, a1, a0=1]
   z = roots(b); p = roots(a);     % [b,a] --> [z,p]
else   % choosing polynomial roots
   gain = 0.001;
   z = 1i*2*pi*[ 600,800 ];         z = [z conj(z)];  
   p = [-1,-1] + 1i*2*pi*[100,200]; p = [p conj(p)];
   b = gain*poly(z);  a = poly(p); % [z,p] --> [b,a]
end

figure;
plot(real(z), imag(z), 'o', real(p), imag(p), 'x');
title("Zeros and Poles"); xlabel("Real Axis"); ylabel("Imag Axis"); grid;

f = 0:1000;
s = 1i*2*pi*f;
H = polyval(b,s) ./ polyval(a,s);

% figure; plot(f, 20*log10(abs(H))); title("|H(f)| (dB)");
figure; plot(f, abs(H)); title("|H(f)|");
% figure; plot(f, unwrap(angle(H))); title("angle(H(f))");
% figure; impulse(b,a);
% figure; step(b,a);