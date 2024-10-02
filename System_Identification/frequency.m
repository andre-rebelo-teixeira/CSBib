% Manually inserting the poles of the discrete system
poles_discrete = [-0.7453 + 0.4566j, -0.7453 - 0.4566j, 0.8002 + 0.1161j, 0.8002 - 0.1161j, 0.1866 + 0.0000j];  % Replace with your actual poles
Ts = 0.02;  % Sampling time

for i = 1:length(poles_discrete)
    % Get the angle of the pole (argument of the complex number)
    omega_d = angle(poles_discrete(i)) / Ts;  % Discrete damped frequency

    % Oscillation frequency (Hz)
    f = abs(omega_d) / (2 * pi);

    fprintf('Discrete Pole: %.4f + %.4fj, Oscillation Frequency: %.4f Hz\n', real(poles_discrete(i)), imag(poles_discrete(i)), f);
end
