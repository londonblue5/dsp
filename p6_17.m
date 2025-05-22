% Problem 6.17, artistic reverb, Konstantinos Litsios

[h,~]=audioread('x06y06.wav');
h = h(:,1);
[bird,fs]=audioread('city_birddd.wav');
bird = bird(:,1);

if size(bird,1)>size(h,1)
    newh = zeros(size(bird,1),1);
    newh(1:size(h,1)) = h;
    y = ifft(fft(newh).*fft(bird));
else
    newbird = zeros(size(h,1),1);
    newbird(1:size(bird,1)) = bird;
    y = ifft(fft(h).*fft(newbird));
end

sound(y,fs);