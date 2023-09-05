filenames = {'piano2.wav', 'trumpet2.wav', 'violin2.wav', 'flute2.wav'};
figure;

for i = 1:length(filenames)
    [audio, fs] = audioread(filenames{i});
    N = length(audio);
    fft_result = fft(audio);
    f = (0:N-1)*(fs/N);
    [~, index] = max(abs(fft_result));
    peak_frequency = f(index);
    
    subplot(2, 2, i);
    plot(f, 20*log10(abs(fft_result)));
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    title(['Instrument: ' filenames{i}]);
    
    fprintf('Instrument: %s\n', filenames{i});
    fprintf('Fundamental Frequency (Hz): %.2f\n', peak_frequency);
end
