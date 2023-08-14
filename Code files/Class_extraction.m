function class_set = Class_extraction(labels, signal, winsize, wininc)

% winsize = 32;
% wininc = 4;

% Labels
[index,labels] = get_labels(labels); % training labels

% Class extraction
class_set = get_class(signal,labels,index,winsize,wininc);

end