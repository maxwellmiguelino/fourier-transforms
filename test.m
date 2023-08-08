Fs = 44100; % sampling frequency
nBits = 16; % bits per sample
nChannels = 1; % number of audio channels
duration = 5; % recording duration

recObj = audiorecorder(Fs, nBits, nChannels); % create audio recorder object
record(recObj, duration); % start recording
wait(recObj); % wait for recording to finish
y = getaudiodata(recObj); % get audio data

t = (0:length(y)-1)/Fs; % time vector
plot(t, y); % plot waveform
xlabel('Time (s)');
ylabel('Amplitude');
title('Recorded audio waveform');
