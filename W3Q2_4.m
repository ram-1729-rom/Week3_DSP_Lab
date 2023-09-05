% Read the first audio file
[y1, fs1] = audioread('trumpet2.wav');

% Read the second audio file
[y2, fs2] = audioread('violin2.wav');

% Calculate the magnitude spectra
spectrum1 = abs(fft(y1));
spectrum2 = abs(fft(y2));

% Create a frequency axis
f1 = linspace(0, fs1, length(spectrum1));
f2 = linspace(0, fs2, length(spectrum2));

% Create a 1x2 subplot
figure;

% Plot the magnitude spectrum of the first audio file
subplot(1, 2, 1);
plot(f1(1:length(f1)/2), 20 * log10(spectrum1(1:length(f1)/2)));
title('Magnitude Spectrum - trumpet2');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
xlim([0, fs1/2]);

% Plot the magnitude spectrum of the second audio file
subplot(1, 2, 2);
plot(f2(1:length(f2)/2), 20 * log10(spectrum2(1:length(f2)/2)));
title('Magnitude Spectrum - violin2');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
xlim([0, fs2/2]);
