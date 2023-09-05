function Access = KeyLock(peak_key)
    % Recording the audio clip password
    % disp('Please whistle for 3 seconds...');
    % audio_clip= audiorecorder(44100, 16, 1);
    % recordblocking(audio_clip, 3);
    % recorded_audio = getaudiodata(audio_clip);

    [rec_audio, fs] = audioread('flute1.wav');
    
    n=length(rec_audio);
    fft_rec = fft(rec_audio);
    f = (-n/2:n/2-1) * (fs/n);
    mag_spec= abs(fft_rec);

    [~, id_rec] = max(mag_spec);
    peak_lock= abs(f(id_rec));
     
    error=0.05*peak_lock;
    if abs(peak_key - peak_lock) <= error
        Access= 'ACCESS GRANTED';
    else
        Access= 'ACCESS DENIED';
    end
end