filenames = {'piano2.wav', 'flute2.wav'};

audio_data = cell(1, length(filenames));
fs_values = zeros(1, length(filenames));

for i = 1:length(filenames)
    [audio_data{i}, fs_values(i)] = audioread(filenames{i});
end

fundamental_frequencies = zeros(1, length(filenames));
for i = 1:length(filenames)
    audio = audio_data{i};
    fs = fs_values(i);

    N = length(audio);
    fft_result = fft(audio);

    f = (0:N-1)*(fs/N);

    [~, index] = max(abs(fft_result));
    peak_frequency = f(index);

    fundamental_frequencies(i) = peak_frequency;
end

difference = abs(fundamental_frequencies(1) - fundamental_frequencies(2));

fprintf('Fundamental Frequency of piano2.wav: %.2f Hz\n', fundamental_frequencies(1));
fprintf('Fundamental Frequency of flute2.wav: %.2f Hz\n', fundamental_frequencies(2));
fprintf('Absolute difference: %.2f Hz\n', difference);
