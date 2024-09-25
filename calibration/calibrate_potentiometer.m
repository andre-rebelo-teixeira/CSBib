%% Load mat file
clear; close all;

load("potentiometer_calibration_file_full_rotation.mat");

%% Process the data
voltage_read = scopeData.signals.values(:, 2);

voltage_diff = max(voltage_read) - min(voltage_read);

angle = 360; % Degree

Kp = angle / voltage_diff;
save('Kp.mat', "Kp");