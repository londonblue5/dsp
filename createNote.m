function n = createNote(f,fraction)
fs = 8192;
bpm = 140;
t = (0:(fraction*60/bpm*fs-1))/fs;
n = sin(2*pi*f*t);
end