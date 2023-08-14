function signal_filt = Bandpass_filtering(signal, fcutlow, fcuthigh)

% % Power Spectral Density analysis
Fs = 1000;
% figure;
% [pxx, ~] = pwelch(signal, [], [], [], Fs);
% plot(pxx(1:250))

% Define the filter parameters
% fcutlow = 20; % Low cutoff frequency
% fcuthigh = 300; % High cutoff frequency
[b, a] = butter(8, [fcutlow/(Fs/2) fcuthigh/(Fs/2)], 'bandpass');

% Filter the signal
signal_filt = filtfilt(b, a, signal);
%s1_signals_filt = max(s1_signals_filt,0);

% Plot the original and filtered signals
% t = 0:1/Fs:(length(signal(:,1))-1)/Fs;
% figure;
% subplot(211)
% plot(t, signal(:,1));
% subplot(212)
% plot(t, signal_filt(:,1));
% xlabel('Time (s)');
% ylabel('Amplitude');

end