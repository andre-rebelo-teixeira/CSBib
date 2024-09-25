clear;

load('Ke.mat');
load('Kp.mat');
sampling_time = 0.02;


u = idinput(length(0:sampling_time:120), 'RBS', [0.015 0.025] , [-1.5 1.5]);
t = 0:sampling_time:120;
action_ = [t; u']';
open_system('model.slx');

set_param('model', 'Stoptime', '120');

sim_out= sim('model.slx');

%%
u= scopeData.signals.values(:,1);
shaft_angle = scopeData.signals.values(:,2);
tip_angle = scopeData.signals.values(:,3);
tip_position = scopeData.signals.values(:,4);
time = scopeData.time;

close all;
figure(1);

hold on;
plot(time, u);
plot(time, shaft_angle);
plot(time, tip_angle);

legend('u', 'shaft angle', 'tip angle', 'tip position');
filename = [datestr(now, 'dd-mm-yyyy-HH-MM-SS') '_all_variables_prbs'];
save(filename);

hold off