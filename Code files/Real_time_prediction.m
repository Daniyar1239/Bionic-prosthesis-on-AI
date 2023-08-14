% Define an a object
clear all
close all
a = arduino('COM4', 'Uno', 'BaudRate', 115200, 'AnalogReferenceMode', 'external', 'AnalogReference', 3.3, 'Libraries','Servo');
s1 = servo(a,'D6');   % ring + little (0.75)
s2 = servo(a, 'D9');  % wrist (0.65)
s3 = servo(a,'D10');   % index + middle (0.85) 
s4 = servo(a, 'D11');  % thumb (0.8)

% Define the number of channels and the window size
%numChannels = 5;
buffer_size = 32;
winsize = 32;
%wininc = 4;

epsilon = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\epsilon_4.mat").epsilon;
minValue = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\minValue_4.mat").minValue;
maxValue = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\maxValue_4.mat").maxValue;
selidx = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\selidx_4.mat").selidx;

% Load the trained SVM model
svmModel = load("C:\Users\Acer\Documents\MATLAB\Custom EMG Dataset\Files for 6 gestures\svmModel_4.mat").svmModel;

% Initialize buffer
buffer = [];
buffer_index = 0;

% Main loop for real-time processing
while true
    sensor1 = (readVoltage(a, 'A0')/3.3)*1023; % center muscle; the farthest sensor
    sensor2 = (readVoltage(a, 'A1')/3.3)*1023; % by 2 right from the center; top right sensor
    sensor3 = (readVoltage(a, 'A2')/3.3)*1023; % by 2 left from the center; top left sensor 
    sensor4 = (readVoltage(a, 'A3')/3.3)*1023; % by 1 right from the center; bottom right sensor    
    sensor5 = (readVoltage(a, 'A4')/3.3)*1023; % by 1 left from the center; bottom left sensor 
    
    % Add the filtered data to the buffer
    buffer = [buffer; sensor1 sensor2 sensor3 sensor4 sensor5];
    buffer_index = buffer_index + 1;
    %disp(buffer_index)

    if buffer_index == buffer_size
        filtered_data = TKEO_denoising(buffer);
        %disp(filtered_data)
        features = RT_feature_extraction(filtered_data, epsilon);
        features = features(:,selidx);
        features = MinMax_scaling(features, minValue, maxValue);
        features(features>1) = 1;
        features(features<0) = 0;
        %disp(features)
        label = predict(svmModel, features);
        disp(label)
        buffer = [];
        buffer_index = 0;
        %buffer(1:end-wininc) = buffer(wininc+1:end);
        %buffer_index = buffer_index - wininc; 
        switch label
            case 0
                writePosition(s1, 0);    % rest
                writePosition(s2, 0);
                writePosition(s3, 0);
                writePosition(s4, 0);
            case 1
                writePosition(s1, 0.75);    % fist
                writePosition(s2, 0);
                writePosition(s3, 0.85);
                writePosition(s4, 0.8);            
            case 2
                writePosition(s1, 0);    % pen grip
                writePosition(s2, 0);
                writePosition(s3, 0.85);
                writePosition(s4, 0.8);               
            case 3
                writePosition(s1, 0.75);    % bar grip
                writePosition(s2, 0);
                writePosition(s3, 0.85);
                writePosition(s4, 0);              
            case 4
                writePosition(s1, 0);    % wrist rotation
                writePosition(s2, 0.65);
                writePosition(s3, 0);
                writePosition(s4, 0);               
            case 5
                writePosition(s1, 0.75);    % gun sign
                writePosition(s2, 0);
                writePosition(s3, 0);
                writePosition(s4, 0);               
        end
    end  
    pause(0.001);
end
