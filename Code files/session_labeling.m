%% 1st session
% TKEO denoising
s1_signals_sess1_filt = TKEO_sample_denoising(s1_signals_sess1, 32, 32);
s1_signals_sess1_filt(isnan(s1_signals_sess1_filt)) = 0;

s1_signals_filt_ch1 = s1_signals_sess1_filt(:,3);
s1_signals_filt_ch1_abs = abs(s1_signals_filt_ch1);

% 1st gesture
g1_onset_offset = 30;
label_sess1 = zeros(size(s1_signals_filt_ch1_abs));
curr_label_sess1 = 0;

% Loop through the EMG signal and label_sess1 each hand movement
for i = 1:length(s1_signals_filt_ch1_abs)-12
    count = sum(diff(label_sess1) == 1);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+12) < g1_onset_offset)

        % Stop label_sess1ing with the current label_sess1 and start label_sess1ing with label_sess1 0
        curr_label_sess1 = 0;
        label_sess1(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+2) >= g1_onset_offset)
        
        % Start label_sess1ing with label_sess1 1
        curr_label_sess1 = 1;
        label_sess1(i) = 1;
    % Continue label_sess1ing with the current label_sess1
    else
        label_sess1(i) = curr_label_sess1;
    end
end
idx = find(label_sess1==1,1,'last');
label_sess1(idx) = 0;

curr_label_sess1 = 0;
idx_1 = find(label_sess1==1,1,'last');

% 2nd gesture
g2_onset_offset = 30;

for i = idx_1:length(s1_signals_filt_ch1_abs)-25
    count = sum(diff(label_sess1(idx_1:end)) == 2);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+25) < g2_onset_offset)
        % Stop label_sess1ing with the current label_sess1 and start label_sess1ing with label_sess1 0
        curr_label_sess1 = 0;
        label_sess1(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+1) >= g2_onset_offset)
        
        % Start label_sess1ing with label_sess1 1
        curr_label_sess1 = 2;
        label_sess1(i) = 2;
        
    % Continue label_sess1ing with the current label_sess1
    else
        label_sess1(i) = curr_label_sess1;
    end
end

idx = find(label_sess1==2,1,'last');
label_sess1(idx) = 0;

curr_label_sess1 = 0;
idx_2 = find(label_sess1==2,1,'last');

% 3rd gesture
g3_onset_offset = 30;

for i = idx_2:length(s1_signals_filt_ch1_abs)-30
    count = sum(diff(label_sess1(idx_2:end)) == 3);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+30) < g3_onset_offset) 
 
        % Stop label_sess1ing with the current label_sess1 and start label_sess1ing with label_sess1 0
        curr_label_sess1 = 0;
        label_sess1(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g3_onset_offset)
        
        % Start label_sess1ing with label_sess1 1
        curr_label_sess1 = 3;
        label_sess1(i) = 3;
        
    % Continue label_sess1ing with the current label_sess1
    else
        label_sess1(i) = curr_label_sess1;
    end
end

idx = find(label_sess1==3,1,'last');
label_sess1(idx) = 0;

curr_label_sess1 = 0;
idx_3 = find(label_sess1==3,1,'last');

% 4th gesture
g4_onset_offset = 50;

for i = idx_3:length(s1_signals_filt_ch1_abs)-15
    count = sum(diff(label_sess1(idx_3:end)) == 4);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+15) < g4_onset_offset)

        % Stop label_sess1_1ing with the current label_sess1_1 and start label_sess1_1ing with label_sess1_1 0
        curr_label_sess1 = 0;
        label_sess1(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g4_onset_offset)  
        
        % Start label_sess1_1ing with label_sess1_1 1
        curr_label_sess1 = 4;
        label_sess1(i) = 4;
        
    % Continue label_sess1_1ing with the current label_sess1_1
    else
        label_sess1(i) = curr_label_sess1;
    end
end
idx = find(label_sess1==4,1,'last');
label_sess1(idx) = 0;

curr_label_sess1 = 0;
idx_4 = find(label_sess1==4,1,'last');

% 5th gesture
g5_onset_offset = 20;

for i = idx_4+100:length(s1_signals_filt_ch1_abs)-70
    count = sum(diff(label_sess1(idx_4+100:end)) == 5);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+70) < g5_onset_offset)

        % Stop label_sess1_1ing with the current label_sess1_1 and start label_sess1_1ing with label_sess1_1 0
        curr_label_sess1 = 0;
        label_sess1(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+0) >= g5_onset_offset)  
        
        % Start label_sess1_1ing with label_sess1_1 1
        curr_label_sess1 = 5;
        label_sess1(i) = 5;
        
    % Continue label_sess1_1ing with the current label_sess1_1
    else
        label_sess1(i) = curr_label_sess1;
    end
end
idx = find(label_sess1==5,1,'last');
label_sess1(idx) = 0;
%% 2nd session
% TKEO denoising
s1_signals_sess2_filt = TKEO_sample_denoising(s1_signals_sess2, 32, 32);
s1_signals_sess2_filt(isnan(s1_signals_sess2_filt)) = 0;

s1_signals_filt_ch1 = s1_signals_sess2_filt(:,3);
s1_signals_filt_ch1_abs = abs(s1_signals_filt_ch1);

% 1st gesture
g1_onset_offset = 30;
label_sess2 = zeros(size(s1_signals_filt_ch1_abs));
curr_label_sess2 = 0;

% Loop through the EMG signal and label_sess2 each hand movement
for i = 1:length(s1_signals_filt_ch1_abs)-12
    count = sum(diff(label_sess2) == 1);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+12) < g1_onset_offset)

        % Stop label_sess2ing with the current label_sess2 and start label_sess2ing with label_sess2 0
        curr_label_sess2 = 0;
        label_sess2(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+2) >= g1_onset_offset)
        
        % Start label_sess2ing with label_sess2 1
        curr_label_sess2 = 1;
        label_sess2(i) = 1;
    % Continue label_sess2ing with the current label_sess2
    else
        label_sess2(i) = curr_label_sess2;
    end
end
idx = find(label_sess2==1,1,'last');
label_sess2(idx) = 0;

curr_label_sess2 = 0;
idx_1 = find(label_sess2==1,1,'last');

% 2nd gesture
g2_onset_offset = 30;

for i = idx_1:length(s1_signals_filt_ch1_abs)-25
    count = sum(diff(label_sess2(idx_1:end)) == 2);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+25) < g2_onset_offset)
        % Stop label_sess2ing with the current label_sess2 and start label_sess2ing with label_sess2 0
        curr_label_sess2 = 0;
        label_sess2(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+2) >= g2_onset_offset)
        
        % Start label_sess2ing with label_sess2 1
        curr_label_sess2 = 2;
        label_sess2(i) = 2;
        
    % Continue label_sess2ing with the current label_sess2
    else
        label_sess2(i) = curr_label_sess2;
    end
end

idx = find(label_sess2==2,1,'last');
label_sess2(idx) = 0;

curr_label_sess2 = 0;
idx_2 = find(label_sess2==2,1,'last');

% 3rd gesture
g3_onset_offset = 30;

for i = idx_2:length(s1_signals_filt_ch1_abs)-30
    count = sum(diff(label_sess2(idx_2:end)) == 3);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+30) < g3_onset_offset) 
 
        % Stop label_sess2ing with the current label_sess2 and start label_sess2ing with label_sess2 0
        curr_label_sess2 = 0;
        label_sess2(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g3_onset_offset)
        
        % Start label_sess2ing with label_sess2 1
        curr_label_sess2 = 3;
        label_sess2(i) = 3;
        
    % Continue label_sess2ing with the current label_sess2
    else
        label_sess2(i) = curr_label_sess2;
    end
end

idx = find(label_sess2==3,1,'last');
label_sess2(idx) = 0;

curr_label_sess2 = 0;
idx_3 = find(label_sess2==3,1,'last');

% 4th gesture
g4_onset_offset = 50;

for i = idx_3:length(s1_signals_filt_ch1_abs)-15
    count = sum(diff(label_sess2(idx_3:end)) == 4);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+15) < g4_onset_offset)

        % Stop label_sess2_1ing with the current label_sess2_1 and start label_sess2_1ing with label_sess2_1 0
        curr_label_sess2 = 0;
        label_sess2(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g4_onset_offset)  
        
        % Start label_sess2_1ing with label_sess2_1 1
        curr_label_sess2 = 4;
        label_sess2(i) = 4;
        
    % Continue label_sess2_1ing with the current label_sess2_1
    else
        label_sess2(i) = curr_label_sess2;
    end
end
idx = find(label_sess2==4,1,'last');
label_sess2(idx) = 0;

curr_label_sess2 = 0;
idx_4 = find(label_sess2==4,1,'last');

% 5th gesture
g5_onset_offset = 20;

for i = idx_4+100:length(s1_signals_filt_ch1_abs)-70
    count = sum(diff(label_sess2(idx_4+100:end)) == 5);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+70) < g5_onset_offset)

        % Stop label_sess2_1ing with the current label_sess2_1 and start label_sess2_1ing with label_sess2_1 0
        curr_label_sess2 = 0;
        label_sess2(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+0) >= g5_onset_offset)  
        
        % Start label_sess2_1ing with label_sess2_1 1
        curr_label_sess2 = 5;
        label_sess2(i) = 5;
        
    % Continue label_sess2_1ing with the current label_sess2_1
    else
        label_sess2(i) = curr_label_sess2;
    end
end
idx = find(label_sess2==5,1,'last');
label_sess2(idx) = 0;
%% 3rd session
% TKEO denoising
s1_signals_sess3_filt = TKEO_sample_denoising(s1_signals_sess3, 32, 32);
s1_signals_sess3_filt(isnan(s1_signals_sess3_filt)) = 0;

s1_signals_filt_ch1 = s1_signals_sess3_filt(:,3);
s1_signals_filt_ch1_abs = abs(s1_signals_filt_ch1);

% 1st gesture
g1_onset_offset = 30;
label_sess3 = zeros(size(s1_signals_filt_ch1_abs));
curr_label_sess3 = 0;

% Loop through the EMG signal and label_sess3 each hand movement
for i = 1:length(s1_signals_filt_ch1_abs)-12
    count = sum(diff(label_sess3) == 1);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+12) < g1_onset_offset)

        % Stop label_sess3ing with the current label_sess3 and start label_sess3ing with label_sess3 0
        curr_label_sess3 = 0;
        label_sess3(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+2) >= g1_onset_offset)
        
        % Start label_sess3ing with label_sess3 1
        curr_label_sess3 = 1;
        label_sess3(i) = 1;
    % Continue label_sess3ing with the current label_sess3
    else
        label_sess3(i) = curr_label_sess3;
    end
end
idx = find(label_sess3==1,1,'last');
label_sess3(idx) = 0;

curr_label_sess3 = 0;
idx_1 = find(label_sess3==1,1,'last');

% 2nd gesture
g2_onset_offset = 30;

for i = idx_1:length(s1_signals_filt_ch1_abs)-25
    count = sum(diff(label_sess3(idx_1:end)) == 2);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+25) < g2_onset_offset)
        % Stop label_sess3ing with the current label_sess3 and start label_sess3ing with label_sess3 0
        curr_label_sess3 = 0;
        label_sess3(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+1) >= g2_onset_offset)
        
        % Start label_sess3ing with label_sess3 1
        curr_label_sess3 = 2;
        label_sess3(i) = 2;
        
    % Continue label_sess3ing with the current label_sess3
    else
        label_sess3(i) = curr_label_sess3;
    end
end

idx = find(label_sess3==2,1,'last');
label_sess3(idx) = 0;

curr_label_sess3 = 0;
idx_2 = find(label_sess3==2,1,'last');

% 3rd gesture
g3_onset_offset = 30;

for i = idx_2:length(s1_signals_filt_ch1_abs)-30
    count = sum(diff(label_sess3(idx_2:end)) == 3);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+30) < g3_onset_offset) 
 
        % Stop label_sess3ing with the current label_sess3 and start label_sess3ing with label_sess3 0
        curr_label_sess3 = 0;
        label_sess3(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g3_onset_offset)
        
        % Start label_sess3ing with label_sess3 1
        curr_label_sess3 = 3;
        label_sess3(i) = 3;
        
    % Continue label_sess3ing with the current label_sess3
    else
        label_sess3(i) = curr_label_sess3;
    end
end

idx = find(label_sess3==3,1,'last');
label_sess3(idx) = 0;

curr_label_sess3 = 0;
idx_3 = find(label_sess3==3,1,'last');

% 4th gesture
g4_onset_offset = 50;

for i = idx_3:length(s1_signals_filt_ch1_abs)-15
    count = sum(diff(label_sess3(idx_3:end)) == 4);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+15) < g4_onset_offset)

        % Stop label_sess3_1ing with the current label_sess3_1 and start label_sess3_1ing with label_sess3_1 0
        curr_label_sess3 = 0;
        label_sess3(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g4_onset_offset)  
        
        % Start label_sess3_1ing with label_sess3_1 1
        curr_label_sess3 = 4;
        label_sess3(i) = 4;
        
    % Continue label_sess3_1ing with the current label_sess3_1
    else
        label_sess3(i) = curr_label_sess3;
    end
end
idx = find(label_sess3==4,1,'last');
label_sess3(idx) = 0;

curr_label_sess3 = 0;
idx_4 = find(label_sess3==4,1,'last');

% 5th gesture
g5_onset_offset = 30;

for i = idx_4+100:length(s1_signals_filt_ch1_abs)-70
    count = sum(diff(label_sess3(idx_4+100:end)) == 5);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+70) < g5_onset_offset)

        % Stop label_sess3_1ing with the current label_sess3_1 and start label_sess3_1ing with label_sess3_1 0
        curr_label_sess3 = 0;
        label_sess3(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+0) >= g5_onset_offset)  
        
        % Start label_sess3_1ing with label_sess3_1 1
        curr_label_sess3 = 5;
        label_sess3(i) = 5;
        
    % Continue label_sess3_1ing with the current label_sess3_1
    else
        label_sess3(i) = curr_label_sess3;
    end
end
idx = find(label_sess3==5,1,'last');
label_sess3(idx) = 0;
%% 4th session 
% TKEO denoising
s1_signals_sess4_filt = TKEO_sample_denoising(s1_signals_sess4, 32, 32);
s1_signals_sess4_filt(isnan(s1_signals_sess4_filt)) = 0;

s1_signals_filt_ch1 = s1_signals_sess4_filt(:,3);
s1_signals_filt_ch1_abs = abs(s1_signals_filt_ch1);

% 1st gesture
g1_onset_offset = 30;
label_sess4 = zeros(size(s1_signals_filt_ch1_abs));
curr_label_sess4 = 0;

% Loop through the EMG signal and label_sess4 each hand movement
for i = 1:length(s1_signals_filt_ch1_abs)-12
    count = sum(diff(label_sess4) == 1);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+12) < g1_onset_offset)

        % Stop label_sess4ing with the current label_sess4 and start label_sess4ing with label_sess4 0
        curr_label_sess4 = 0;
        label_sess4(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+2) >= g1_onset_offset)
        
        % Start label_sess4ing with label_sess4 1
        curr_label_sess4 = 1;
        label_sess4(i) = 1;
    % Continue label_sess4ing with the current label_sess4
    else
        label_sess4(i) = curr_label_sess4;
    end
end
idx = find(label_sess4==1,1,'last');
label_sess4(idx) = 0;

curr_label_sess4 = 0;
idx_1 = find(label_sess4==1,1,'last');

% 2nd gesture
g2_onset_offset = 30;

for i = idx_1:length(s1_signals_filt_ch1_abs)-25
    count = sum(diff(label_sess4(idx_1:end)) == 2);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+25) < g2_onset_offset)
        % Stop label_sess4ing with the current label_sess4 and start label_sess4ing with label_sess4 0
        curr_label_sess4 = 0;
        label_sess4(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+1) >= g2_onset_offset)
        
        % Start label_sess4ing with label_sess4 1
        curr_label_sess4 = 2;
        label_sess4(i) = 2;
        
    % Continue label_sess4ing with the current label_sess4
    else
        label_sess4(i) = curr_label_sess4;
    end
end

idx = find(label_sess4==2,1,'last');
label_sess4(idx) = 0;

curr_label_sess4 = 0;
idx_2 = find(label_sess4==2,1,'last');

% 3rd gesture
g3_onset_offset = 30;

for i = idx_2:length(s1_signals_filt_ch1_abs)-30
    count = sum(diff(label_sess4(idx_2:end)) == 3);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+30) < g3_onset_offset) 
 
        % Stop label_sess4ing with the current label_sess4 and start label_sess4ing with label_sess4 0
        curr_label_sess4 = 0;
        label_sess4(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g3_onset_offset)
        
        % Start label_sess4ing with label_sess4 1
        curr_label_sess4 = 3;
        label_sess4(i) = 3;
        
    % Continue label_sess4ing with the current label_sess4
    else
        label_sess4(i) = curr_label_sess4;
    end
end

idx = find(label_sess4==3,1,'last');
label_sess4(idx) = 0;

curr_label_sess4 = 0;
idx_3 = find(label_sess4==3,1,'last');

% 4th gesture
g4_onset_offset = 50;

for i = idx_3:length(s1_signals_filt_ch1_abs)-15
    count = sum(diff(label_sess4(idx_3:end)) == 4);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+15) < g4_onset_offset)

        % Stop label_sess4_1ing with the current label_sess4_1 and start label_sess4_1ing with label_sess4_1 0
        curr_label_sess4 = 0;
        label_sess4(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g4_onset_offset)  
        
        % Start label_sess4_1ing with label_sess4_1 1
        curr_label_sess4 = 4;
        label_sess4(i) = 4;
        
    % Continue label_sess4_1ing with the current label_sess4_1
    else
        label_sess4(i) = curr_label_sess4;
    end
end
idx = find(label_sess4==4,1,'last');
label_sess4(idx) = 0;

curr_label_sess4 = 0;
idx_4 = find(label_sess4==4,1,'last');

% 5th gesture
g5_onset_offset = 30;

for i = idx_4+100:length(s1_signals_filt_ch1_abs)-70
    count = sum(diff(label_sess4(idx_4+100:end)) == 5);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+70) < g5_onset_offset)

        % Stop label_sess4_1ing with the current label_sess4_1 and start label_sess4_1ing with label_sess4_1 0
        curr_label_sess4 = 0;
        label_sess4(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+0) >= g5_onset_offset)  
        
        % Start label_sess4_1ing with label_sess4_1 1
        curr_label_sess4 = 5;
        label_sess4(i) = 5;
        
    % Continue label_sess4_1ing with the current label_sess4_1
    else
        label_sess4(i) = curr_label_sess4;
    end
end
idx = find(label_sess4==5,1,'last');
label_sess4(idx) = 0; 
%% 5th session
% TKEO denoising
s1_signals_sess5_filt = TKEO_sample_denoising(s1_signals_sess5, 32, 32);
s1_signals_sess5_filt(isnan(s1_signals_sess5_filt)) = 0;

s1_signals_filt_ch1 = s1_signals_sess5_filt(:,3);
s1_signals_filt_ch1_abs = abs(s1_signals_filt_ch1);
s1_signals_filt_ch1_abs(21076:21078) = 0;
s1_signals_filt_ch1_abs(23018:23020) = 0;

% 1st gesture
g1_onset_offset = 30;
label_sess5 = zeros(size(s1_signals_filt_ch1_abs));
curr_label_sess5 = 0;

% Loop through the EMG signal and label_sess5 each hand movement
for i = 1:length(s1_signals_filt_ch1_abs)-12
    count = sum(diff(label_sess5) == 1);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+12) < g1_onset_offset)

        % Stop label_sess5ing with the current label_sess5 and start label_sess5ing with label_sess5 0
        curr_label_sess5 = 0;
        label_sess5(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+2) >= g1_onset_offset)
        
        % Start label_sess5ing with label_sess5 1
        curr_label_sess5 = 1;
        label_sess5(i) = 1;
    % Continue label_sess5ing with the current label_sess5
    else
        label_sess5(i) = curr_label_sess5;
    end
end
idx = find(label_sess5==1,1,'last');
label_sess5(idx) = 0;

curr_label_sess5 = 0;
idx_1 = find(label_sess5==1,1,'last');

% 2nd gesture
g2_onset_offset = 30;

for i = idx_1:length(s1_signals_filt_ch1_abs)-25
    count = sum(diff(label_sess5(idx_1:end)) == 2);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+25) < g2_onset_offset)
        % Stop label_sess5ing with the current label_sess5 and start label_sess5ing with label_sess5 0
        curr_label_sess5 = 0;
        label_sess5(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+1) >= g2_onset_offset)
        
        % Start label_sess5ing with label_sess5 1
        curr_label_sess5 = 2;
        label_sess5(i) = 2;
        
    % Continue label_sess5ing with the current label_sess5
    else
        label_sess5(i) = curr_label_sess5;
    end
end

idx = find(label_sess5==2,1,'last');
label_sess5(idx) = 0;

curr_label_sess5 = 0;
idx_2 = find(label_sess5==2,1,'last');

% 3rd gesture
g3_onset_offset = 30;

for i = idx_2:length(s1_signals_filt_ch1_abs)-30
    count = sum(diff(label_sess5(idx_2:end)) == 3);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+30) < g3_onset_offset) 
 
        % Stop label_sess5ing with the current label_sess5 and start label_sess5ing with label_sess5 0
        curr_label_sess5 = 0;
        label_sess5(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g3_onset_offset)
        
        % Start label_sess5ing with label_sess5 1
        curr_label_sess5 = 3;
        label_sess5(i) = 3;
        
    % Continue label_sess5ing with the current label_sess5
    else
        label_sess5(i) = curr_label_sess5;
    end
end

idx = find(label_sess5==3,1,'last');
label_sess5(idx) = 0;

curr_label_sess5 = 0;
idx_3 = find(label_sess5==3,1,'last');

% 4th gesture
g4_onset_offset = 50;

for i = idx_3:length(s1_signals_filt_ch1_abs)-15
    count = sum(diff(label_sess5(idx_3:end)) == 4);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+15) < g4_onset_offset)

        % Stop label_sess5_1ing with the current label_sess5_1 and start label_sess5_1ing with label_sess5_1 0
        curr_label_sess5 = 0;
        label_sess5(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g4_onset_offset)  
        
        % Start label_sess5_1ing with label_sess5_1 1
        curr_label_sess5 = 4;
        label_sess5(i) = 4;
        
    % Continue label_sess5_1ing with the current label_sess5_1
    else
        label_sess5(i) = curr_label_sess5;
    end
end
idx = find(label_sess5==4,1,'last');
label_sess5(idx) = 0;

curr_label_sess5 = 0;
idx_4 = find(label_sess5==4,1,'last');

% 5th gesture
g5_onset_offset = 30;

for i = idx_4+100:length(s1_signals_filt_ch1_abs)-70
    count = sum(diff(label_sess5(idx_4+100:end)) == 5);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+70) < g5_onset_offset)

        % Stop label_sess5_1ing with the current label_sess5_1 and start label_sess5_1ing with label_sess5_1 0
        curr_label_sess5 = 0;
        label_sess5(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+0) >= g5_onset_offset)  
        
        % Start label_sess5_1ing with label_sess5_1 1
        curr_label_sess5 = 5;
        label_sess5(i) = 5;
        
    % Continue label_sess5_1ing with the current label_sess5_1
    else
        label_sess5(i) = curr_label_sess5;
    end
end
idx = find(label_sess5==5,1,'last');
label_sess5(idx) = 0; 
%% 6th session 
% TKEO denoising
s1_signals_sess6_filt = TKEO_sample_denoising(s1_signals_sess6, 32, 32);
s1_signals_sess6_filt(isnan(s1_signals_sess6_filt)) = 0;

s1_signals_filt_ch1 = s1_signals_sess6_filt(:,3);
s1_signals_filt_ch1_abs = abs(s1_signals_filt_ch1);
s1_signals_filt_ch1_abs(20537:20539) = 0;
s1_signals_filt_ch1_abs(22952:22954) = 0;

% 1st gesture
g1_onset_offset = 30;
label_sess6 = zeros(size(s1_signals_filt_ch1_abs));
curr_label_sess6 = 0;

% Loop through the EMG signal and label_sess6 each hand movement
for i = 1:length(s1_signals_filt_ch1_abs)-12
    count = sum(diff(label_sess6) == 1);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+12) < g1_onset_offset)

        % Stop label_sess6ing with the current label_sess6 and start label_sess6ing with label_sess6 0
        curr_label_sess6 = 0;
        label_sess6(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+2) >= g1_onset_offset)
        
        % Start label_sess6ing with label_sess6 1
        curr_label_sess6 = 1;
        label_sess6(i) = 1;
    % Continue label_sess6ing with the current label_sess6
    else
        label_sess6(i) = curr_label_sess6;
    end
end
idx = find(label_sess6==1,1,'last');
label_sess6(idx) = 0;

curr_label_sess6 = 0;
idx_1 = find(label_sess6==1,1,'last');

% 2nd gesture
g2_onset_offset = 30;

for i = idx_1:length(s1_signals_filt_ch1_abs)-25
    count = sum(diff(label_sess6(idx_1:end)) == 2);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+25) < g2_onset_offset)
        % Stop label_sess6ing with the current label_sess6 and start label_sess6ing with label_sess6 0
        curr_label_sess6 = 0;
        label_sess6(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+1) >= g2_onset_offset)
        
        % Start label_sess6ing with label_sess6 1
        curr_label_sess6 = 2;
        label_sess6(i) = 2;
        
    % Continue label_sess6ing with the current label_sess6
    else
        label_sess6(i) = curr_label_sess6;
    end
end

idx = find(label_sess6==2,1,'last');
label_sess6(idx) = 0;

curr_label_sess6 = 0;
idx_2 = find(label_sess6==2,1,'last');

% 3rd gesture
g3_onset_offset = 30;

for i = idx_2:length(s1_signals_filt_ch1_abs)-30
    count = sum(diff(label_sess6(idx_2:end)) == 3);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+30) < g3_onset_offset) 
 
        % Stop label_sess6ing with the current label_sess6 and start label_sess6ing with label_sess6 0
        curr_label_sess6 = 0;
        label_sess6(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g3_onset_offset)
        
        % Start label_sess6ing with label_sess6 1
        curr_label_sess6 = 3;
        label_sess6(i) = 3;
        
    % Continue label_sess6ing with the current label_sess6
    else
        label_sess6(i) = curr_label_sess6;
    end
end

idx = find(label_sess6==3,1,'last');
label_sess6(idx) = 0;

curr_label_sess6 = 0;
idx_3 = find(label_sess6==3,1,'last');

% 4th gesture
g4_onset_offset = 50;

for i = idx_3:length(s1_signals_filt_ch1_abs)-15
    count = sum(diff(label_sess6(idx_3:end)) == 4);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+15) < g4_onset_offset)

        % Stop label_sess6_1ing with the current label_sess6_1 and start label_sess6_1ing with label_sess6_1 0
        curr_label_sess6 = 0;
        label_sess6(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g4_onset_offset)  
        
        % Start label_sess6_1ing with label_sess6_1 1
        curr_label_sess6 = 4;
        label_sess6(i) = 4;
        
    % Continue label_sess6_1ing with the current label_sess6_1
    else
        label_sess6(i) = curr_label_sess6;
    end
end
idx = find(label_sess6==4,1,'last');
label_sess6(idx) = 0;

curr_label_sess6 = 0;
idx_4 = find(label_sess6==4,1,'last');

% 5th gesture
g5_onset_offset = 20;

for i = idx_4+100:length(s1_signals_filt_ch1_abs)-70
    count = sum(diff(label_sess6(idx_4+100:end)) == 5);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+70) < g5_onset_offset)

        % Stop label_sess6_1ing with the current label_sess6_1 and start label_sess6_1ing with label_sess6_1 0
        curr_label_sess6 = 0;
        label_sess6(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+0) >= g5_onset_offset)  
        
        % Start label_sess6_1ing with label_sess6_1 1
        curr_label_sess6 = 5;
        label_sess6(i) = 5;
        
    % Continue label_sess6_1ing with the current label_sess6_1
    else
        label_sess6(i) = curr_label_sess6;
    end
end
idx = find(label_sess6==5,1,'last');
label_sess6(idx) = 0; 
%% 7th session 
% TKEO denoising
s1_signals_sess7_filt = TKEO_sample_denoising(s1_signals_sess7, 32, 32);
s1_signals_sess7_filt(isnan(s1_signals_sess7_filt)) = 0;

s1_signals_filt_ch1 = s1_signals_sess7_filt(:,3);
s1_signals_filt_ch1_abs = abs(s1_signals_filt_ch1);
s1_signals_filt_ch1_abs(19113:19115) = 0;
% s1_signals_filt_ch1_abs(22952:22954) = 0;

% 1st gesture
g1_onset_offset = 30;
label_sess7 = zeros(size(s1_signals_filt_ch1_abs));
curr_label_sess7 = 0;

% Loop through the EMG signal and label_sess7 each hand movement
for i = 1:length(s1_signals_filt_ch1_abs)-12
    count = sum(diff(label_sess7) == 1);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+12) < g1_onset_offset)

        % Stop label_sess7ing with the current label_sess7 and start label_sess7ing with label_sess7 0
        curr_label_sess7 = 0;
        label_sess7(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+2) >= g1_onset_offset)
        
        % Start label_sess7ing with label_sess7 1
        curr_label_sess7 = 1;
        label_sess7(i) = 1;
    % Continue label_sess7ing with the current label_sess7
    else
        label_sess7(i) = curr_label_sess7;
    end
end
idx = find(label_sess7==1,1,'last');
label_sess7(idx) = 0;

curr_label_sess7 = 0;
idx_1 = find(label_sess7==1,1,'last');

% 2nd gesture
g2_onset_offset = 30;

for i = idx_1:length(s1_signals_filt_ch1_abs)-25
    count = sum(diff(label_sess7(idx_1:end)) == 2);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+25) < g2_onset_offset)
        % Stop label_sess7ing with the current label_sess7 and start label_sess7ing with label_sess7 0
        curr_label_sess7 = 0;
        label_sess7(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+1) >= g2_onset_offset)
        
        % Start label_sess7ing with label_sess7 1
        curr_label_sess7 = 2;
        label_sess7(i) = 2;
        
    % Continue label_sess7ing with the current label_sess7
    else
        label_sess7(i) = curr_label_sess7;
    end
end

idx = find(label_sess7==2,1,'last');
label_sess7(idx) = 0;

curr_label_sess7 = 0;
idx_2 = find(label_sess7==2,1,'last');

% 3rd gesture
g3_onset_offset = 30;

for i = idx_2:length(s1_signals_filt_ch1_abs)-30
    count = sum(diff(label_sess7(idx_2:end)) == 3);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+30) < g3_onset_offset) 
 
        % Stop label_sess7ing with the current label_sess7 and start label_sess7ing with label_sess7 0
        curr_label_sess7 = 0;
        label_sess7(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g3_onset_offset)
        
        % Start label_sess7ing with label_sess7 1
        curr_label_sess7 = 3;
        label_sess7(i) = 3;
        
    % Continue label_sess7ing with the current label_sess7
    else
        label_sess7(i) = curr_label_sess7;
    end
end

idx = find(label_sess7==3,1,'last');
label_sess7(idx) = 0;

curr_label_sess7 = 0;
idx_3 = find(label_sess7==3,1,'last');

% 4th gesture
g4_onset_offset = 50;

for i = idx_3:length(s1_signals_filt_ch1_abs)-15
    count = sum(diff(label_sess7(idx_3:end)) == 4);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+15) < g4_onset_offset)

        % Stop label_sess7_1ing with the current label_sess7_1 and start label_sess7_1ing with label_sess7_1 0
        curr_label_sess7 = 0;
        label_sess7(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g4_onset_offset)  
        
        % Start label_sess7_1ing with label_sess7_1 1
        curr_label_sess7 = 4;
        label_sess7(i) = 4;
        
    % Continue label_sess7_1ing with the current label_sess7_1
    else
        label_sess7(i) = curr_label_sess7;
    end
end
idx = find(label_sess7==4,1,'last');
label_sess7(idx) = 0;

curr_label_sess7 = 0;
idx_4 = find(label_sess7==4,1,'last');

% 5th gesture
g5_onset_offset = 20;

for i = idx_4+100:length(s1_signals_filt_ch1_abs)-70
    count = sum(diff(label_sess7(idx_4+100:end)) == 5);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+70) < g5_onset_offset)

        % Stop label_sess7_1ing with the current label_sess7_1 and start label_sess7_1ing with label_sess7_1 0
        curr_label_sess7 = 0;
        label_sess7(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+0) >= g5_onset_offset)  
        
        % Start label_sess7_1ing with label_sess7_1 1
        curr_label_sess7 = 5;
        label_sess7(i) = 5;
        
    % Continue label_sess7_1ing with the current label_sess7_1
    else
        label_sess7(i) = curr_label_sess7;
    end
end
idx = find(label_sess7==5,1,'last');
label_sess7(idx) = 0; 
%% 8th session 
% TKEO denoising
s1_signals_sess8_filt = TKEO_sample_denoising(s1_signals_sess8, 32, 32);
s1_signals_sess8_filt(isnan(s1_signals_sess8_filt)) = 0;

s1_signals_filt_ch1 = s1_signals_sess8_filt(:,3);
s1_signals_filt_ch1_abs = abs(s1_signals_filt_ch1);
% s1_signals_filt_ch1_abs(19113:19115) = 0;
% s1_signals_filt_ch1_abs(22952:22954) = 0;

% 1st gesture
g1_onset_offset = 30;
label_sess8 = zeros(size(s1_signals_filt_ch1_abs));
curr_label_sess8 = 0;

% Loop through the EMG signal and label_sess8 each hand movement
for i = 1:length(s1_signals_filt_ch1_abs)-12
    count = sum(diff(label_sess8) == 1);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+12) < g1_onset_offset)

        % Stop label_sess8ing with the current label_sess8 and start label_sess8ing with label_sess8 0
        curr_label_sess8 = 0;
        label_sess8(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+2) >= g1_onset_offset)
        
        % Start label_sess8ing with label_sess8 1
        curr_label_sess8 = 1;
        label_sess8(i) = 1;
    % Continue label_sess8ing with the current label_sess8
    else
        label_sess8(i) = curr_label_sess8;
    end
end
idx = find(label_sess8==1,1,'last');
label_sess8(idx) = 0;

curr_label_sess8 = 0;
idx_1 = find(label_sess8==1,1,'last');

% 2nd gesture
g2_onset_offset = 30;

for i = idx_1:length(s1_signals_filt_ch1_abs)-25
    count = sum(diff(label_sess8(idx_1:end)) == 2);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+25) < g2_onset_offset)
        % Stop label_sess8ing with the current label_sess8 and start label_sess8ing with label_sess8 0
        curr_label_sess8 = 0;
        label_sess8(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+1) >= g2_onset_offset)
        
        % Start label_sess8ing with label_sess8 1
        curr_label_sess8 = 2;
        label_sess8(i) = 2;
        
    % Continue label_sess8ing with the current label_sess8
    else
        label_sess8(i) = curr_label_sess8;
    end
end

idx = find(label_sess8==2,1,'last');
label_sess8(idx) = 0;

curr_label_sess8 = 0;
idx_2 = find(label_sess8==2,1,'last');

% 3rd gesture
g3_onset_offset = 30;

for i = idx_2:length(s1_signals_filt_ch1_abs)-30
    count = sum(diff(label_sess8(idx_2:end)) == 3);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+30) < g3_onset_offset) 
 
        % Stop label_sess8ing with the current label_sess8 and start label_sess8ing with label_sess8 0
        curr_label_sess8 = 0;
        label_sess8(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g3_onset_offset)
        
        % Start label_sess8ing with label_sess8 1
        curr_label_sess8 = 3;
        label_sess8(i) = 3;
        
    % Continue label_sess8ing with the current label_sess8
    else
        label_sess8(i) = curr_label_sess8;
    end
end

idx = find(label_sess8==3,1,'last');
label_sess8(idx) = 0;

curr_label_sess8 = 0;
idx_3 = find(label_sess8==3,1,'last');

% 4th gesture
g4_onset_offset = 50;

for i = idx_3:length(s1_signals_filt_ch1_abs)-15
    count = sum(diff(label_sess8(idx_3:end)) == 4);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+15) < g4_onset_offset)

        % Stop label_sess8_1ing with the current label_sess8_1 and start label_sess8_1ing with label_sess8_1 0
        curr_label_sess8 = 0;
        label_sess8(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+3) >= g4_onset_offset)  
        
        % Start label_sess8_1ing with label_sess8_1 1
        curr_label_sess8 = 4;
        label_sess8(i) = 4;
        
    % Continue label_sess8_1ing with the current label_sess8_1
    else
        label_sess8(i) = curr_label_sess8;
    end
end
idx = find(label_sess8==4,1,'last');
label_sess8(idx) = 0;

curr_label_sess8 = 0;
idx_4 = find(label_sess8==4,1,'last');

% 5th gesture
g5_onset_offset = 20;

for i = idx_4+100:length(s1_signals_filt_ch1_abs)-70
    count = sum(diff(label_sess8(idx_4+100:end)) == 5);
    if count == 11
        break;
    end
    % Check if the current sample is less than the onset amplitude of either gesture
    if all(s1_signals_filt_ch1_abs(i:i+70) < g5_onset_offset)

        % Stop label_sess8_1ing with the current label_sess8_1 and start label_sess8_1ing with label_sess8_1 0
        curr_label_sess8 = 0;
        label_sess8(i) = 0;
        
    % Check if the current sample is equal or higher than the onset amplitude of the first gesture
    elseif all(s1_signals_filt_ch1_abs(i:i+0) >= g5_onset_offset)  
        
        % Start label_sess8_1ing with label_sess8_1 1
        curr_label_sess8 = 5;
        label_sess8(i) = 5;
        
    % Continue label_sess8_1ing with the current label_sess8_1
    else
        label_sess8(i) = curr_label_sess8;
    end
end
idx = find(label_sess8==5,1,'last');
label_sess8(idx) = 0; 
%% Merging labels and sessions

s1_signals = [s1_signals_sess1; s1_signals_sess2; s1_signals_sess3; s1_signals_sess4; s1_signals_sess5; s1_signals_sess6; s1_signals_sess7; s1_signals_sess8];
s1_labels = [label_sess1; label_sess2; label_sess3; label_sess4; label_sess5; label_sess6; label_sess7; label_sess8];

save("s1_signals_6gest.mat","s1_signals");
save("s1_labels_6gest.mat","s1_labels");

clear count curr_label_sess1 curr_label_sess2 curr_label_sess3 curr_label_sess4 curr_label_sess5 curr_label_sess6 curr_label_sess7 curr_label_sess8...
    g1_onset_offset g2_onset_offset g3_onset_offset g4_onset_offset g5_onset_offset i idx idx_1 idx_2 idx_3 idx_4 idx_5 label_sess1...
    label_sess2 label_sess3 label_sess4 label_sess5 label_sess6 label_sess7 label_sess8 s1_signals_filt_ch1 s1_signals_filt_ch1_abs...
    s1_signals_sess1 s1_signals_sess2 s1_signals_sess3 s1_signals_sess4 s1_signals_sess5 s1_signals_sess6 s1_signals_sess7 s1_signals_sess8...
    s1_signals_sess1_filt s1_signals_sess2_filt  s1_signals_sess3_filt  s1_signals_sess4_filt  s1_signals_sess5_filt s1_signals_sess6_filt...
    s1_signals_sess7_filt  s1_signals_sess8_filt  