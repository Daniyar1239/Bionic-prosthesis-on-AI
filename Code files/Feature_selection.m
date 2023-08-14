s1_signals = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Saved labelled data\s1_signals_6gest.mat").s1_signals;
s1_labels = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Saved labelled data\s1_labels_6gest.mat").s1_labels;

winsize = 32;
wininc = 32; 

s1_signals_filt = TKEO_sample_denoising(s1_signals, winsize, wininc);

epsilon = threshold_calculation(s1_labels, s1_signals_filt, 0.7);

feature_set = Feature_extraction(s1_signals_filt, epsilon, winsize, wininc);
class_set = Class_extraction(s1_labels, s1_signals_filt, winsize, wininc);

minValue = min(feature_set);
maxValue = max(feature_set);

feature_norm = MinMax_scaling(feature_set, minValue, maxValue);
%% Relief feature selection
rng("default");
[idx,weights] = relieff(feature_norm,class_set,10);
save("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\idx_4.mat","idx");
bar(weights(idx))
xlabel('Predictor rank')
ylabel('Predictor importance weight')
%%
rng('default')
% s1_signals = load("s1_signals_5gest.mat").s1_signals;
% s1_labels = load("s1_labels_5gest.mat").s1_labels;
idx = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\idx_4.mat").idx;
 
cv = cvpartition(s1_labels, 'KFold', 5, 'Stratify', true);

accuracies = zeros(1,35);
accuracy_fold = zeros(1,5);
for i = 36:70
    for j = 1:cv.NumTestSets
        % Get the training and test folds
        X_train = s1_signals(training(cv, j),:);
        X_test = s1_signals(test(cv, j),:);
        y_train = s1_labels(training(cv, j),:);
        y_test = s1_labels(test(cv, j),:);
    
        % Preprocess the training data using your custom function
        X_train = TKEO_sample_denoising(X_train, winsize, wininc);
        X_test = TKEO_sample_denoising(X_test, winsize, wininc);
        
        epsilon = threshold_calculation(y_train, X_train, 0.7);
        feature_train = Feature_extraction(X_train, epsilon, winsize, wininc);
        feature_test = Feature_extraction(X_test, epsilon, winsize, wininc);
        class_train = Class_extraction(y_train, X_train, winsize, wininc);
        class_test = Class_extraction(y_test, X_test, winsize, wininc);
        
        minValue = min(feature_train);
        maxValue = max(feature_train);
        feature_train_norm = MinMax_scaling(feature_train, minValue, maxValue);
        feature_test_norm = MinMax_scaling(feature_test, minValue, maxValue);
        
        feature_test_norm(feature_test_norm>1) = 1;
        feature_test_norm(feature_test_norm<0) = 0;

        feature_train_norm_fs = feature_train_norm(:,idx(1:i));
        feature_train_norm_fs = feature_train_norm_fs';
        
        t = templateSVM('KernelScale', 1, 'KernelFunction', "rbf");
        options = statset('UseParallel',true);
        
        svmModel = fitcecoc(feature_train_norm_fs, class_train, 'Coding', 'onevsone', 'ObservationsIn', 'columns', 'Learners', t, 'Options', options);
        predictedLabels = predict(svmModel, feature_test_norm(:,idx(1:i)));
        accuracy_fold(j) = 1 - length(find(predictedLabels ~= class_test)) / length(class_test);
    end
    avg_accuracy = mean(accuracy_fold);
    disp(avg_accuracy) 
    accuracies(i-35) = avg_accuracy;
end
%%
inc = find(accuracies == max(accuracies));
selidx = idx(1:35+inc);
save("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\selidx_4.mat", "selidx");