clear; close all; clc;

load('IdentificationData.mat')

Q = C'*C;
R = 100;
G = B;
Qe = 1;
rhoe = 10;
Re = 1/rhoe;

[K,S,e] = dlqr(A,B,Q,R);

Nbar = inv(C*inv(eye(size(A)) - A + B*K)*B);

[M,P,Z,E] = dlqe(A,G,C,Qe,Re);

time = 0:sampling_time:120;

open_system('parte2.slx');

set_param('parte2', 'SimulationCommand', 'start');

sim_out= sim('parte2.slx');
%%
filename = [datestr(now, 'dd-mm-yyyy-HH-MM-SS') '_parte2_-45degrees'];
save(filename);