fs = 8000;
dur = 2;
recording = audiorecorder(fs, 8, 1);
disp('Press any key to start recording...');
pause;
record(recording);
pause(dur);
stop(recording);
play(recording);
pause(dur);
audio = getaudiodata(recording);
t = (0:size(audio)-1)/fs;
% plot(t,audio, '-o'); title('My voice');
n1=4000; Ndct=2^13; c=dct(audio(n1:n1+Ndct-1),'Type',4);
plot(c,'.-');
