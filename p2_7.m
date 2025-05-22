clear;
fs = 8192;
bf = 210;
% bpm at createNote

% release the inner Mozart
m = cell(20,1);

m{1} = createNote(bf,1/2);
m{2} = createNote(0,1/2);
m{3} = createNote(bf,1/4);
m{4} = createNote(0,1/4);
m{5} = createNote(bf,3/16);
m{6} = createNote(0,1/16);
m{7} = createNote(bf,3/16);
m{8} = createNote(0,1/16);

m{9} = createNote(bf*2^(3/12),1/2);
m{10} = createNote(bf,1/2);
m{11} = createNote(bf*2^(3/12),1/2);
m{12} = createNote(bf,1/2);

m{13} = createNote(bf/2^(4/12),2/4);
m{14} = createNote(0,1/4);
m{15} = createNote(bf/2^(4/12),2/4);
m{16} = createNote(0,1/4);
m{17} = createNote(bf/2^(4/12),1/4);
m{18} = createNote(0,1/4);

m{19} = createNote(bf/2^(5/12),1/2);
m{20} = createNote(bf/2^(9/12),1/2);
m{21} = createNote(bf/2,1/2);
m{22} = createNote(0,1/2);

melody = horzcat(m{:});
sound(melody);

% for 140 bpm
t = (0:length(melody)-1)/fs;
plot(t,melody)
