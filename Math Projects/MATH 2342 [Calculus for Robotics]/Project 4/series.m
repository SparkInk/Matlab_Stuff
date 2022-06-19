
syms t

% distance between the wheels and initial conditions
L = 0.5;
vR = 2 - 0.5 * t; % change according to the problem being solved
vL = 1;
theta0 = 0;

% declaration of arrays for coordinates and angle
vMain = (vR + vL) / 2;
angSpeed =(vR - vL) / L;
theta = theta0 +int(angSpeed, t);

x = vMain * cos(theta);
y = vMain * sin(theta);

% we first calculate values for the original function
xValue= vpaintegral(x, t, [0 3]);
yValue = vpaintegral(y, t, [0 3]);

% calculate preliminary values for the Taylor series
X = taylor(x, t, 'Order', 4);
Y = taylor(y, t, 'Order', 4);
X = vpaintegral(X, t, [0 3]);
Y = vpaintegral(Y, t, [0 3]);

i = 5;
while double(abs(yValue - Y)) > 0.01 && double(abs(xValue - X)) > 0.01
    
    X = taylor(x, t, 'Order', i);
    Y = taylor(y, t, 'Order', i);
    X = vpaintegral(X, t, [0 3]);
    Y = vpaintegral(Y, t, [0 3]);
    i = i + 1;
end

disp('The number of terms is ');
disp(i);
