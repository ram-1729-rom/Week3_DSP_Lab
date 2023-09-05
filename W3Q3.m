[y,Fs] = audioread('Opera.wav'); 

Y = fft(y); 
f = Fs*(0:length(y)-1)/length(y); 
plot(f,db(abs(Y)));

xlabel('Frequency (Hz)');
ylabel('Magnitude(dB)');
N = length(y)/10; 
M = floor(length(y)/N);

for i = 1:M
    y_segment = y((i-1)*N+1:i*N);
    Y_segment = fft(y_segment); 
    f_segment = Fs*(0:N-1)/N; 
    subplot(M,2,i)
    plot(f_segment,db(abs(Y_segment)));
end