simulink_model_name = "model.slx";
sampling_frequency = 50; % Hz


% Open Simulink model
open_system(simulink_model_name);

% Set simulation parameters
set_param('my_model', 'StopTime', '15S');

% Run the simulation
simOut = sim('my_model');

% Get simulation results
output = simOut.get('yout');


