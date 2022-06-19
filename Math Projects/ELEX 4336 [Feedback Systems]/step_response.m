% mD^2 + bD + k = f(t)
% P = [0 0 1];
% Q = [ 1 22 40];

P = [1];
Q = [1 22 40];

sys = tf(P, Q);
T = 0:0.01:10;
step(sys, T);
ylabel('Position');
xlabel('Time');
title('Position vs Time');
grid on;
