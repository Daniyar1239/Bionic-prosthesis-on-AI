function feature_set = Feature_extraction(signal, epsilon, winsize, wininc)

addpath 'C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Feature Functions'

% RMS
%rms_feat = RootMeanSquare(signal, winsize, wininc); % 1-3
% MAV
%mav_feat = MeanAbsoluteValue(signal, winsize, wininc); % 4-6
% LDAMV
%ldamv_feat = LogDifferenceAbsoluteMeanValue(signal, winsize, wininc); % 7-9
% LDASDV
ldasdv_feat = LogDifferenceAbsoluteStandardDeviationValue(signal, winsize, wininc); % 10-12
% MYOP
myop_feat = MyopulsePercentageRate(signal, epsilon, winsize, wininc); % 13-15
% SKEW
skew_feat = Skewness(signal, winsize, wininc); % 16-18
% CARD
card_feat = Cardinality(signal, epsilon, winsize, wininc); % 19-21 
% KURT
kurt_feat = Kurtosis(signal, winsize, wininc); % 22-24
% MMAV1
%mmav1_feat = ModifiedMeanAbsoluteValue1(signal, winsize, wininc); % 25-27
% MMAV2
%mmav2_feat = ModifiedMeanAbsoluteValue2(signal, winsize, wininc); % 28-30
% SSC
ssc_feat = SlopeSignChange(signal, epsilon, winsize, wininc); % 31-33
% TM
%tm_feat = TemporalMoment(signal, 4, winsize, wininc); % 34-36
% VO
%vo_feat = VOrder(signal, 4, winsize, wininc); % 37-39
% WAMP
wamp_feat = WillisonAmplitude(signal, epsilon, winsize, wininc); % 40-42
% WL
%wl_feat = WaveformLength(signal, winsize, wininc); % 43-45
% ZC
zc_feat = ZeroCrossing(signal, epsilon, winsize, wininc); % 46-48
% AR4
ar4_feat = AutoRegressiveModel(signal, 4, winsize, wininc); % 49-60
% DASDV
%dasdv_feat = DifferenceAbsoluteStandardDeviationValue(signal, winsize, wininc); % 61-63
% HIST
%hist_feat = Histogram(signal, winsize, wininc, -2:2); % 64-75
%hist_feat(:, all(~hist_feat,1)) = []; 
% MFL
mfl_feat = MaximumFractalLength(signal, winsize, wininc); % 76-78 
% ShEn
shen_feat = ShannonEntropy(signal, winsize, wininc); % 79-81

% feature_set = [rms_feat mav_feat ldamv_feat ldasdv_feat myop_feat skew_feat card_feat kurt_feat...
%     mmav1_feat mmav2_feat ssc_feat tm_feat vo_feat wamp_feat wl_feat zc_feat ar4_feat dasdv_feat...
%     hist_feat mfl_feat shen_feat];

feature_set = [ldasdv_feat myop_feat skew_feat card_feat kurt_feat...
    ssc_feat wamp_feat zc_feat ar4_feat mfl_feat shen_feat];

%Eliminate discontinuties in signals, which are -Inf and NaN values
for i = 1:size(feature_set,2)
    feat = feature_set(:,i);
    infIndices = isinf(feat);
    NaNIndices = isnan(feat);
    %infIndicesVec = 1:numel(feat);
    %NaNIndicesVec = 1:numel(feat);
    %feat(infIndices) = interp1(infIndicesVec(~infIndices), feat(~infIndices), infIndicesVec(infIndices));
    feat(infIndices) = 0;
    %feat(NaNIndices) = interp1(NaNIndicesVec(~NaNIndices), feat(~NaNIndices), NaNIndicesVec(NaNIndices));
    feat(NaNIndices) = 0;
    feature_set(:,i) = feat;
end
end