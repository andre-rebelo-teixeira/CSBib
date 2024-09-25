% clear;
% close all; 
% 
% %% Get Ke and Kp constant to convert data from volt to angle
% load('../calibration/Ke.mat');
% load("../calibration/Kp.mat");
% load("1_correct_run_square_wave_no_drif.mat"); 

t = scopeData.time; 
sigs = scopeData.signals.values;

utrend = sigs (1:5999 ,1) ; % Input signal
thetae = sigs (1:5999 ,2) ; % Potentiometer signal
alphae = sigs (1:5999 ,3) ; % Starin gage signal
u = u(1:5999);

% Computation of total bar angle
ytrend = thetae + alphae;

af = 0.5;
Afilt = [1 -af];
Bfilt = (1 - af) *[1 -1];
% Filtering and detrending
yf = filter ( Bfilt , Afilt , ytrend ) ;


% u = detrend ( utrend ) ;

z = [ yf u ];
na = 5; % AR part
nb = 3; % X part
nc = na ; % MA part
nk = 1; % pure delay
nn = [ na nb nc nk ];
th = armax (z , nn ); % this is a structure in identification toolbox format


[ den1 , num1 ] = polydata ( th ) ;

yfsim  =  filter ( num1 , den1 , u ) ;  % Equivalent to idsim (u , th ) ;

[ num , den ] = eqtflength ( num1 , conv ( den1 , [1 -1]) ) ;

[A , B , C , D ]=tf2ss ( num , den ) ;

t = t(1:5999);

close all;
figure(1);
hold on
plot(t, yf)
plot(t, yfsim)
legend('yf', 'yfsim');
ylabel('degrees - �');
xlabel('time - sec');
grid on;
hold off