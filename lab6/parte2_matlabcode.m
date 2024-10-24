clear; clc;

load('IdentificationData.mat')

Q = C'*C;
R_ = 10;
G = B;
Qe_ = 1;
Re_ = 1;

[K,S,e] = dlqr(A,B,Q,R_);
Nbar = inv(C*inv(eye(size(A)) - A + B*K)*B);
[M,P,Z,E] = dlqe(A,G,C,Qe_,Re_);
time = 0:sampling_time:120;



open_system('parte2_simulink.slx');
set_param('parte2_simulink', 'SimulationCommand', 'start');
sim_out= sim('parte2_simulink.slx');

%%
filename = [datestr(now, 'dd-mm-yyyy-HH-MM-SS') sprintf('_parte2_R%d_Qe%d_Re%d_GI0_0175_noise.mat', R_, Qe_, Re_)];
save(filename);
    




