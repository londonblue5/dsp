clear; close all;
fs = 8000;
nos = input('For how many seconds do you want to record? ');

disp('press any key to record...');
pause;
rec = audiorecorder(fs, 8, 1);
record(rec);
pause(nos);
stop(rec);
disp('Hi');
% now let's reverse the order
audio = getaudiodata(rec, 'single');
N = length(audio);
% disp(['number of samples: ' num2str(N) '. time*fs: ' num2str(nos*fs)]);
sps = fix(N/nos);
x = zeros(N, 1);
for ii = 1:nos
    x(1+(nos-ii)*sps:(nos-ii+1)*sps) = audio(1+sps*(ii-1):sps*ii);
end
sound(x,fs);