clear; close all; clc;

load('IdentificationData.mat')

Q = C'*C;
R = 50;
G = B;
Qe = 0.1;
Re = 1;

% A_ = [ A B; zeros(1,5) 1];
% B_ = [zeros(5,1) 1];

[K,S,e] = dlqr(A,B,Q,R);

Nbar = inv(C*inv(eye(size(A)) - A + B*K)*B);

[M,P,Z,E] = dlqe(A,G,C,Qe,Re);

time = 0:sampling_time:120;

open_system('parte2.slx');

set_param('parte2', 'SimulationCommand', 'start');

sim_out= sim('parte2.slx');
%%
filename = [datestr(now, 'dd-mm-yyyy-HH-MM-SS') '_parte2_R50_G0_009'];
save(filename);
