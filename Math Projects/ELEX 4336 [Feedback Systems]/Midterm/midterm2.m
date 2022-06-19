

%{ 

    Matlab midterm. ELEX 4336 

%}

%{ 

                    Q1

%}
s = tf('s');

% transfer function 1
tfOne = 50 / (10 * s^2 + 140 * s + 40);

% transfer function 2
tfTwo = 80 / (s^2 + 26 * s + 80);

% transfer function 3
tfThree = 10 / (s^2 + 80 * s + 40);

% plot the step response 
% step(tfOne);
% hold on;
% step(tfTwo);
% step(tfThree);

% add legend to plots
% legend('G1(s)', 'G2(s)', 'G3(s)');
% hold off;


%{ 

                    Q2

%}
q2tf = (0.1*s + 1)/(s^3 + 9 * s^2 + 7 * s + 1);
% step(q2tf);
% legend('Uncompensated')

%{ 

                    Q3

%}
q3tf = 5 * (s + 2)/(s * (s + 1)*(s + 5));

%{ 

                    Q4

%}
q4tf = 5 / (s^2 + 14 * s + 4);

newq4tf = q4tf * (-0.1233) * (s - 183.4);

