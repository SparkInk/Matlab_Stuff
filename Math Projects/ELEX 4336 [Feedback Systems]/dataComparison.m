%{
****************************************
Main file to compare data from the prediction
and the raw data that was taken in the lab.

Author: Iakov Umrikhin
Date Created: 16.02.2022
Date Modified: 16.02.2022 <- never actually being updated >:)))
***************************************
%}

% harvest raw data from the file

rawData = importdata('waveformVelocity[lab3].isf');
timeRaw = rawData(:, 1) + 2.76;
voltageRaw = rawData(:, 2);

% harvest the step function data
stepData = importdata('waveFormStep[lab3].isf');
stepTime = stepData(:, 1) + 2.76;
stepVoltage = stepData(:, 2);

% generate data from a transfer function with a given gain and time
% constant

% For this step we need a gain K, and a time constant tau
K = 20;
%tau = 3.165; % time constant; [s]
tau = 3.18;

P = [K];
Q = [tau 1];

sysTF = tf(P, Q);

[voltPred, timePred] = step(sysTF, stepDataOptions('StepAmplitude', 0.4));

%stepDataOptions('StepAmplitude', 1);
% plot raw data
plot(timeRaw, voltageRaw, 'b', timePred, voltPred, 'r', stepTime, stepVoltage, 'k');
xlim([0, 7.5]);
xlabel('Time [s]');
ylabel('Voltage [V]');
title('Predicted step and Raw step; tau = 3.18; Kp = 20');
legend('Raw Data', 'Predicted Data', 'Step Response');
grid on;