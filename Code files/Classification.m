s1_signals = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Saved labelled data\s1_signals_6gest.mat").s1_signals;
s1_labels = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Saved labelled data\s1_labels_6gest.mat").s1_labels;

addpath 'C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures'
rng('default')
%split = cvpartition(s1_labels, 'HoldOut', 0.2);
split = cvpartition(s1_labels, 'KFold', 5, 'Stratify', true);
accuracies = zeros(split.NumTestSets, 1);

tic
for i = 1:split.NumTestSets
%     testIdx = split.test;
%     trainIdx = split.training;
    X_train = s1_signals(training(split, i),:);
    y_train = s1_labels(training(split, i),:);
    X_test = s1_signals(test(split, i),:);
    y_test = s1_labels(test(split, i),:);
    
    winsize = 32; % 64 is better
    wininc = 32; % 64 is better

    X_train = TKEO_sample_denoising(X_train, winsize, wininc);
    X_test = TKEO_sample_denoising(X_test, winsize, wininc);

%     X_train = Bandpass_filtering(X_train, 20, 250);
%     X_test = Bandpass_filtering(X_test, 20, 250);

    
    epsilon = threshold_calculation(y_train, X_train, 0.7);
    
    feature_train = Feature_extraction(X_train, epsilon, winsize, wininc);
    feature_test = Feature_extraction(X_test, epsilon, winsize, wininc);
    class_train = Class_extraction(y_train, X_train, winsize, wininc);
    class_test = Class_extraction(y_test, X_test, winsize, wininc);
    
    selidx = load('selidx_4.mat').selidx;
    feature_train = feature_train(:,selidx);
    feature_test = feature_test(:,selidx);
    
    % mu = mean(feature_train);
    % stdf = std(feature_train);
    % 
    % feature_train_norm = (feature_train - mu)./stdf;
    % feature_test_norm = (feature_test - mu)./stdf;
    
    minValue = min(feature_train);
    maxValue = max(feature_train);
    
    feature_train_norm = MinMax_scaling(feature_train, minValue, maxValue);
    feature_test_norm = MinMax_scaling(feature_test, minValue, maxValue);
    
    feature_test_norm(feature_test_norm>1) = 1;
    feature_test_norm(feature_test_norm<0) = 0;
    
    % [coeff,scoreTrain,~,~,explained,mu] = pca(feature_train_norm);
    % pca_idx = find(cumsum(explained)>95,1);
    % 
    % feature_train_95 = scoreTrain(:,1:pca_idx);
    % feature_test_95 = (feature_test_norm - mu)*coeff(:, 1:pca_idx); 
    % 
    % feature_train_95 = feature_train_95';
    
    feature_train_norm = feature_train_norm';
    
    params = load("bestSVMparams_4.mat").optimizedParams;
    t = templateSVM('KernelScale', params.KernelScale, 'BoxConstraint', params.BoxConstraint, 'KernelFunction', "rbf");
    %t = templateSVM('KernelScale', 1, 'KernelFunction', 'rbf');
    options = statset('UseParallel',true);
    
    % svmModel = fitcecoc(feature_train_95, class_train, 'Coding', 'onevsone', 'ObservationsIn','columns', 'Learners', t, 'Options', options);
    svmModel = fitcecoc(feature_train_norm, class_train, 'Coding', 'onevsone', 'ObservationsIn','columns', 'Learners', t, 'Options', options);
    % predictedLabels = predict(svmModel, feature_test_95);
    predictedLabels = predict(svmModel, feature_test_norm);
    accuracies(i) = 1 - length(find(predictedLabels ~= class_test)) / length(class_test);
    figure;
    confusionchart(class_test, predictedLabels)
end

avg_accuracy = mean(accuracies);
toc;
disp(avg_accuracy)
