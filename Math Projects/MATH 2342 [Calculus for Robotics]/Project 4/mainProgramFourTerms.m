%{
    The main program for the PROJECT 4
%}

syms t

% distance between the wheels and initial conditions
L = 0.5;
vR = 2 - 0.5 * t; % change according to the problem being solved
vL = 1;
theta0 = 0;
% declaration of arrays for coordinates and angle
x = (100000);
y = (100000);

vMain = (vR + vL) / 2;
angSpeed =(vR - vL) / L;

theta = theta0 +int(angSpeed, t);

i = 1;

for time = 0:0.1:3 
    
    % main values 
   
    x(i) = trapezium(vMain * cos(theta), 0, time);
    y(i) = trapezium(vMain * sin(theta), 0, time);
    
    i = i + 1;
end

% to compute Maclaurin series we used Matlab's internal functions: int()and
% taylor()
T = (0:0.1:3);
X =  T.^4/2 - T.^3 - T.^2/8 + (3*T)/2;
Y = (11*T.^5)/30 - (15*T.^4)/32 - (5*T.^3)/12 + (3*T.^2)/2;

% plotting the functions
plot(x, y, 'r', X, Y, 'b');
grid on;
legend('Original', 'Maclaurin series');
title('Original function vs 4 terms');