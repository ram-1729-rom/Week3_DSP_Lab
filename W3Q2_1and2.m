
fs = 44100;  % Sample rate (you can adjust this)
duration = 3;  % Duration of the recording in seconds
recorder = audiorecorder(fs, 16, 1);  % 16-bit, mono
disp('Start whistling...');
record(recorder, duration);
pause(duration);  % Wait for the recording to finish
disp('Recording finished.');
whistle_audio = getaudiodata(recorder);

% Calculate the FFT for the recorded audio
fft_result = fft(whistle_audio);

% Calculate the magnitude spectrum
magnitude_spectrum = abs(fft_result);

% Calculate the corresponding frequency values
num_samples = length(whistle_audio);
frequency_values = (0:num_samples-1) * (fs / num_samples);

% Find the index of the largest peak (fundamental harmonic)
[~, max_index] = max(magnitude_spectrum);

% Get the corresponding frequency value
fundamental_frequency = frequency_values(max_index);

% Plot the magnitude spectrum
figure;
plot(frequency_values, magnitude_spectrum);
title('Spectrum of whistling (reference)');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Display the fundamental frequency
fprintf('The fundamental frequency of the whistling is approximately %.2f Hz.\n', fundamental_frequency);