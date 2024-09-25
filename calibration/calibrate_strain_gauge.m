%% Load and process the CCW 
clear; close all; 
load('strain_gauge_calibration_bar_5_ccw.mat');

mean_strain_ccw = mean(scopeData.signals.values(:, 3));

%% Load and process CW
clear scopeData;
load('strain_gauge_calibration_bar_5_cw.mat');

mean_strain_cw = mean(scopeData.signals.values(:, 3));

%% handle the angles
inch = 2.54; % cm 
L = 106;  %cm

angles = (-1:2:1) * 5 * 1/4 * inch / L * 180  / pi;
angle_diff = angles(1) + angles(1);

% CCW is the negative angle, take this into consideration

Ke = angle_diff / (mean_strain_ccw - mean_strain_cw);
save("Ke.mat", "Ke");

