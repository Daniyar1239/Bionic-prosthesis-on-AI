function Optimization()
% Define the hyperparameter search space
vars = [
    optimizableVariable('KernelScale', [1, 20], 'Transform', 'log');
    optimizableVariable('BoxConstraint', [1, 20], 'Transform', 'log');
];

% Set up the optimization problem
opt = bayesopt(@svmObjectiveFunction, vars, 'IsObjectiveDeterministic', true, 'MaxObjectiveEvaluations', 50, 'AcquisitionFunctionName', 'expected-improvement-plus', 'Verbose',1);

% Run the optimization
optimizedParams = opt.XAtMinObjective;
save("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\bestSVMparams_4","optimizedParams");

end

% Define the objective function for SVM optimization
function avgError = svmObjectiveFunction(params)

s1_signals = load("s1_signals_6gest.mat").s1_signals;
s1_labels = load("s1_labels_6gest.mat").s1_labels;

rng("default")
cv = cvpartition(s1_labels, 'KFold', 5, 'Stratify', true);
errors = zeros(cv.NumTestSets, 1);

for i = 1:cv.NumTestSets
    % Get the training and test folds
    X_train = s1_signals(training(cv, i),:);
    X_test = s1_signals(test(cv, i),:);
    y_train = s1_labels(training(cv, i),:);
    y_test = s1_labels(test(cv, i),:);

    winsize = 32; 
    wininc = 32;
    
    % Preprocess the training data using your custom function
    X_train = TKEO_sample_denoising(X_train, winsize, wininc);
    X_test = TKEO_sample_denoising(X_test, winsize, wininc);
    
    epsilon = threshold_calculation(y_train, X_train, 0.7);
    
    feature_train = Feature_extraction(X_train, epsilon, winsize, wininc);
    feature_test = Feature_extraction(X_test, epsilon, winsize, wininc);
    class_train = Class_extraction(y_train, X_train, winsize, wininc);
    class_test = Class_extraction(y_test, X_test, winsize, wininc);
    selidx = load('C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\selidx_4.mat').selidx;

    feature_train = feature_train(:,selidx);
    feature_test = feature_test(:,selidx);
    
    minValue = min(feature_train);
    maxValue = max(feature_train);
    
    feature_train_norm = MinMax_scaling(feature_train, minValue, maxValue);
    feature_test_norm = MinMax_scaling(feature_test, minValue, maxValue);
    
    feature_test_norm(feature_test_norm>1) = 1;
    feature_test_norm(feature_test_norm<0) = 0;

    feature_train_norm = feature_train_norm';

    t = templateSVM('KernelScale', params.KernelScale, 'BoxConstraint', params.BoxConstraint, 'KernelFunction', 'rbf');
    options = statset('UseParallel',true);

    % Train SVM classifier with the given hyperparameters
    svmModel = fitcecoc(feature_train_norm, class_train, 'Coding','onevsone', 'ObservationsIn','columns', 'Learners',t, 'Options', options);
    
    % Test the classifier on the preprocessed test data
    predictedLabels = predict(svmModel, feature_test_norm);
    
    % Calculate class. error
    errors(i) = length(find(predictedLabels ~= class_test)) / length(class_test);
end
    
% Calculate average class. error
avgError = mean(errors);

end