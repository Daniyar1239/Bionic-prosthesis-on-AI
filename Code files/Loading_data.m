function signal = Loading_data(sess_num)

opts = spreadsheetImportOptions("NumVariables", 5);

% Specify sheet
opts.Sheet = "Лист1";

% Specify column names and types
opts.VariableNames = ["VarName1", "VarName2", "VarName3", "VarName4", "VarName5"];
opts.VariableTypes = ["double", "double", "double", "double", "double"];

% Import the data
signal = readtable(sprintf("C:/Users/Acer/Documents/MATLAB/Custom EMG Dataset/Signals/session%d_6gest.xlsx", sess_num), opts, "UseExcel", false);
signal = table2array(signal);
signal(signal<0) = 0;

end