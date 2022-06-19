% L * D(i) + Ri +  (1/C) D-1(i) = Vin
% i = C * dV/dt
% CL * d^2(V)/dt + RC * d(V)/dt + V = Vin

L = 10e-3;  % inductance
C = 10e-9; % capacitance
Rcoil = 24; % coil's resistance
R = 1.2e3 % main resistor resistance
Rgen = 50;  % generator's resistance
T = [0.0002];
% Vin = u(t); => P(D) = [1];
% Q(D) = [CL (R+Rgen+Rcoil)*C 1]
P = [.5];    % numerator
Q = [C * L (R + Rgen + Rcoil) * C 1];   % denominator 
sys = tf(P, Q); % transfer function for the RCL circuit

% plot the step response
[yPred, tPred] = step(sys, T);
ylabel('Voltage');
xlabel('Time');
title ('Voltage Resposne vs Time');
grid on;

% Calculating the root of the denominator Q(D);
roots(Q);

% import the raw data
rawdata = importdata('getwfm.isf');
tActual = rawdata(:, 1) + 0.5e-4;
yActual = rawdata(:, 2);
% plot real data vs predicted
plot(tPred, yPred,'*', tActual, yActual, '--');
grid on;