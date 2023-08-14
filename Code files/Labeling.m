function labels = Labeling(signal, x, g1_onset_offset,g1_prev_sample, g1_adv_sample,g2_onset_offset,g2_prev_sample, g2_adv_sample,...
    g3_onset_offset,g3_prev_sample, g3_adv_sample, g4_onset_offset, g4_prev_sample, g4_adv_sample,...
    g5_onset_offset, g5_prev_sample, g5_adv_sample)

% TKEO denoising
signal_filt = TKEO_sample_denoising(signal, 32, 32);
signal_filt(isnan(signal_filt)) = 0;

signal_filt_ch1 = signal_filt(:,3);
signal_filt_ch1_abs = abs(signal_filt_ch1);

labels = zeros(size(signal_filt_ch1_abs));
curr_label = 0;

% Loop through the EMG signal and labels each hand movement
% 1st gesture
if any(ismember(x, 1))
    for i = 1:length(signal_filt_ch1_abs)-g1_prev_sample
        count = sum(diff(labels) == 1);
        if count == 11
            break;
        end
        % Check if the current sample is less than the onset amplitude of either gesture
        if all(signal_filt_ch1_abs(i:i+g1_prev_sample) < g1_onset_offset)

            % Stop labelsing with the current labels and start labelsing with labels 0
            curr_label = 0;
            labels(i) = 0;

            % Check if the current sample is equal or higher than the onset amplitude of the first gesture
        elseif all(signal_filt_ch1_abs(i:i+g1_adv_sample) >= g1_onset_offset)

            % Start labelsing with labels 1
            curr_label = 1;
            labels(i) = 1;
            % Continue labelsing with the current labels
        else
            labels(i) = curr_label;
        end
    end
end
idx = find(labels==1,1,'last');
labels(idx) = 0;

curr_label = 0;
if any(ismember(x, 1))
    idx_1 = find(labels==1,1,'last');
else
    idx_1 = 1;
end

% 2nd gesture
if any(ismember(x, 2))
    for i = idx_1:length(signal_filt_ch1_abs)-g2_prev_sample
        count = sum(diff(labels(idx_1:end)) == 2);
        if count == 11
            break;
        end
        % Check if the current sample is less than the onset amplitude of either gesture
        if all(signal_filt_ch1_abs(i:i+g2_prev_sample) < g2_onset_offset)
            % Stop labelsing with the current labels and start labelsing with labels 0
            curr_label = 0;
            labels(i) = 0;

            % Check if the current sample is equal or higher than the onset amplitude of the first gesture
        elseif all(signal_filt_ch1_abs(i:i+g2_adv_sample) >= g2_onset_offset)

            % Start labelsing with labels 1
            curr_label = 2;
            labels(i) = 2;

            % Continue labelsing with the current labels
        else
            labels(i) = curr_label;
        end
    end
end

idx = find(labels==2,1,'last');
labels(idx) = 0;

curr_label = 0;

if any(ismember(x, 2))
    idx_2 = find(labels==2,1,'last');
else 
    idx_2 = idx_1;
end

% 3rd gesture
if any(ismember(x, 3))
    for i = idx_2:length(signal_filt_ch1_abs)-g3_prev_sample
        count = sum(diff(labels(idx_2:end)) == 3);
        if count == 11
            break;
        end
        % Check if the current sample is less than the onset amplitude of either gesture
        if all(signal_filt_ch1_abs(i:i+g3_prev_sample) < g3_onset_offset)

            % Stop labelsing with the current labels and start labelsing with labels 0
            curr_label = 0;
            labels(i) = 0;

            % Check if the current sample is equal or higher than the onset amplitude of the first gesture
        elseif all(signal_filt_ch1_abs(i:i+g3_adv_sample) >= g3_onset_offset)

            % Start labelsing with labels 1
            curr_label = 3;
            labels(i) = 3;

            % Continue labelsing with the current labels
        else
            labels(i) = curr_label;
        end
    end
end

idx = find(labels==3,1,'last');
labels(idx) = 0;

curr_label = 0;
idx_3 = find(labels==3,1,'last');

% 4th gesture
if any(ismember(x, 4))
    for i = idx_3:length(signal_filt_ch1_abs)-g4_prev_sample
        count = sum(diff(labels(idx_3:end)) == 4);
        if count == 11
            break;
        end
        % Check if the current sample is less than the onset amplitude of either gesture
        if all(signal_filt_ch1_abs(i:i+g4_prev_sample) < g4_onset_offset)

            % Stop labels_1ing with the current labels_1 and start labels_1ing with labels_1 0
            curr_label = 0;
            labels(i) = 0;

            % Check if the current sample is equal or higher than the onset amplitude of the first gesture
        elseif all(signal_filt_ch1_abs(i:i+g4_adv_sample) >= g4_onset_offset)

            % Start labels_1ing with labels_1 1
            curr_label = 4;
            labels(i) = 4;

            % Continue labels_1ing with the current labels_1
        else
            labels(i) = curr_label;
        end
    end
end

idx = find(labels==4,1,'last');
labels(idx) = 0;

curr_label = 0;

if any(ismember(x, 4))
    idx_4 = find(labels==4,1,'last');
else 
    idx_4 = idx_2;
end

% 5th gesture
if any(ismember(x, 5))
    for i = idx_4+100:length(signal_filt_ch1_abs)-g5_prev_sample
        count = sum(diff(labels(idx_4+100:end)) == 5);
        if count == 11
            break;
        end
        % Check if the current sample is less than the onset amplitude of either gesture
        if all(signal_filt_ch1_abs(i:i+g5_prev_sample) < g5_onset_offset)

            % Stop labels_1ing with the current labels_1 and start labels_1ing with labels_1 0
            curr_label = 0;
            labels(i) = 0;

            % Check if the current sample is equal or higher than the onset amplitude of the first gesture
        elseif all(signal_filt_ch1_abs(i:i+g5_adv_sample) >= g5_onset_offset)

            % Start labels_1ing with labels_1 1
            curr_label = 5;
            labels(i) = 5;

            % Continue labels_1ing with the current labels_1
        else
            labels(i) = curr_label;
        end
    end
end

idx = find(labels==5,1,'last');
labels(idx) = 0;

end