function ldamv_feat = LogDifferenceAbsoluteMeanValue(x, winsize, wininc)

datasize = size(x,1);
Nchannels = size(x,2);
numwin = floor((datasize - winsize)/wininc)+1;
datawin = ones(winsize, 1);   % rectangular window

ldamv_feat = zeros(numwin, Nchannels);

st = 1;
en = winsize;

for i = 1:numwin
    cur_win = x(st:en,:).*repmat(datawin,1,Nchannels);
    ldamv_feat(i,:) = log(1/(length(cur_win)-1)*sum(abs(diff(cur_win))));
   
    st = st + wininc;
    en = en + wininc;
end
end