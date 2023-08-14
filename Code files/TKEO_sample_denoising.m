function signal_filt = TKEO_sample_denoising(x, winsize, wininc)

datasize = size(x,1);
Nchannels = size(x,2);
numwin = floor((datasize - winsize)/wininc)+1;
datawin = ones(winsize, 1);

idx = numwin*winsize + 1;

st = 1;
en = winsize;

signal_filt = [];

for i = 1:numwin
    cur_win = x(st:en,:).*repmat(datawin,1,Nchannels);
    signal = TKEO_denoising(cur_win);
    signal_filt = vertcat(signal_filt, signal);
   
    st = st + wininc;
    en = en + wininc;
end

signal = TKEO_denoising(x(idx:end,:));
signal_filt = vertcat(signal_filt, signal);

end