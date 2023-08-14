%% Load data
s1_signals = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Saved labelled data\s1_signals_6gest.mat").s1_signals;
s1_labels = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Saved labelled data\s1_labels_6gest.mat").s1_labels;
%% Denoising
winsize = 32; 
wininc = 32;
s1_signals_filt = TKEO_sample_denoising(s1_signals, winsize, wininc);
%% Feature extraction
epsilon = threshold_calculation(s1_labels,s1_signals_filt,0.7);
save("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\epsilon_4.mat", "epsilon");

feature_set = Feature_extraction(s1_signals_filt, epsilon, winsize, wininc);
class_set = Class_extraction(s1_labels, s1_signals_filt, winsize, wininc);

selidx = load('C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\selidx_4.mat').selidx;
feature_set = feature_set(:,selidx);

% Feature scaling
minValue = min(feature_set);
maxValue = max(feature_set);
save("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\minValue_4.mat", "minValue");
save("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\maxValue_4.mat", "maxValue");

feature_norm = MinMax_scaling(feature_set, minValue, maxValue);
%% Classification
params = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\bestSVMparams_4.mat").optimizedParams;
t = templateSVM('KernelScale', params.KernelScale, 'BoxConstraint', params.BoxConstraint, 'KernelFunction', "rbf");
options = statset('UseParallel',true);

feature_norm = feature_norm';
svmModel = fitcecoc(feature_norm, class_set, 'Coding', 'onevsone', 'ObservationsIn', 'columns', 'Learners', t, 'Options', options);

save("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\svmModel_4.mat", "svmModel");