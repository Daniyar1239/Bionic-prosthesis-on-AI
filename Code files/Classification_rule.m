%% Loading signal sessions
s1_signals_sess1 = Loading_data(4);
s1_signals_sess2 = Loading_data(5);
s1_signals_sess3 = Loading_data(6);
s1_signals_sess4 = Loading_data(7);
s1_signals_sess5 = Loading_data(8);
s1_signals_sess6 = Loading_data(9);
s1_signals_sess7 = Loading_data(10);
s1_signals_sess8 = Loading_data(11);
s1_signals_sess9 = Loading_data(12);
s1_signals_sess10 = Loading_data(13);
s1_signals_sess11 = Loading_data(14);
s1_signals_sess12 = Loading_data(15);
s1_signals_sess13 = Loading_data(16);
s1_signals_sess14 = Loading_data(17);
s1_signals_sess15 = Loading_data(18);
s1_signals_sess16 = Loading_data(19);
s1_signals_sess17 = Loading_data(20);
s1_signals_sess18 = Loading_data(21);
s1_signals_sess19 = Loading_data(22);
s1_signals_sess20 = Loading_data(23);
s1_signals_sess21 = Loading_data(24);
%% Labeling the signal sessions
s1_signals = [s1_signals_sess1; s1_signals_sess2; s1_signals_sess3; s1_signals_sess4;...
    s1_signals_sess5; s1_signals_sess6; s1_signals_sess7; s1_signals_sess8; s1_signals_sess9;...
    s1_signals_sess10; s1_signals_sess11; s1_signals_sess12; s1_signals_sess13; s1_signals_sess14;...
    s1_signals_sess15; s1_signals_sess16; s1_signals_sess17; s1_signals_sess18; s1_signals_sess19;...
    s1_signals_sess20; s1_signals_sess21];
s1_labels = [];

% 1st session
label_1 = Labeling(s1_signals_sess1, [1 2 3 4 5], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_1);

% 2nd session
label_2 = Labeling(s1_signals_sess2, [1 2 3 4 5], 30, 12, 2, 30, 25, 2, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_2);

% 3rd session
label_3 = Labeling(s1_signals_sess3, [1 2 3 4 5], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 30, 70, 0);
s1_labels = vertcat(s1_labels, label_3);

% 4th session
label_4 = Labeling(s1_signals_sess4, [1 2 3 4 5], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 30, 70, 0);
s1_labels = vertcat(s1_labels, label_4);

% 5th session
label_5 = Labeling(s1_signals_sess5, [1 2 3 4 5], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 30, 70, 0);
s1_labels = vertcat(s1_labels, label_5);

% 6th session
label_6 = Labeling(s1_signals_sess6, [1 2 3 4 5], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_6);

% 7th session
label_7 = Labeling(s1_signals_sess7, [1 2 3 4 5], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_7);

% 8th session
label_8 = Labeling(s1_signals_sess8, [1 2 3 4 5], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_8);

% 9th session
label_9 = Labeling(s1_signals_sess9, [2 5], 30, 12, 2, 30, 25, 2, 30, 30, 3, 50, 15, 3, 20, 60, 0);
s1_labels = vertcat(s1_labels, label_9);

% 10th session
label_10 = Labeling(s1_signals_sess10, [2 5], 30, 12, 2, 35, 25, 3, 30, 30, 3, 50, 15, 3, 30, 60, 1);
s1_labels = vertcat(s1_labels, label_10);

% 11th session
label_11 = Labeling(s1_signals_sess11, [2 5], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 30, 50, 0);
s1_labels = vertcat(s1_labels, label_11);

% 12th session
label_12 = Labeling(s1_signals_sess12, [2 5], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_12);

% 13th session
label_13 = Labeling(s1_signals_sess13, [2 3], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_13);

% 14th session
label_14 = Labeling(s1_signals_sess14, [2 3], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_14);

% 15th session
label_15 = Labeling(s1_signals_sess15, [1 2 3 4 5], 30, 12, 2, 30, 25, 1, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_15);

%16th session
label_16 = Labeling(s1_signals_sess16, [1 3], 30, 12, 2, 30, 25, 3, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_16);

%17th session
label_17 = Labeling(s1_signals_sess17, [1 3], 30, 20, 2, 30, 25, 3, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_17);

%18th session
label_18 = Labeling(s1_signals_sess18, [1 3], 30, 20, 2, 30, 25, 3, 30, 30, 3, 50, 15, 3, 20, 70, 0);
s1_labels = vertcat(s1_labels, label_18);

%19th session
label_19 = Labeling(s1_signals_sess19, [1 2 3 4 5], 30, 20, 3, 60, 25, 4, 30, 30, 3, 50, 15, 3, 10, 20, 1);
s1_labels = vertcat(s1_labels, label_19);

%20th session
label_20 = Labeling(s1_signals_sess20, [1 2 3 4 5], 30, 20, 3, 60, 25, 4, 30, 20, 3, 50, 15, 3, 10, 30, 1);
s1_labels = vertcat(s1_labels, label_20);

%21th session
label_21 = Labeling(s1_signals_sess21, [1 2 3 4 5], 30, 20, 3, 60, 25, 4, 30, 20, 3, 50, 15, 3, 10, 50, 1);
s1_labels = vertcat(s1_labels, label_21);

% plot(s1_signals_sess20(:,3)./max(s1_signals_sess20(:,3)))
% hold on
% plot(label_20)

save("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Saved labelled data\s1_signals_6gest.mat", "s1_signals");
save("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Saved labelled data\s1_labels_6gest.mat", "s1_labels");