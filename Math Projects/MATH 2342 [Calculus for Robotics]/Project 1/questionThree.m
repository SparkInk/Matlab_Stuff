% Question #3
syms x

epsilon = 0.0001;

eqnOriginal = nthroot((x - 4), 5) - 0.25; % f(x) 
                                          % the root is 4.00098

rootLeft = 3.1;
rootRight = 5.1;
midPoint = vpa((rootLeft + rootRight) / 2, 5);

fValueLeft = double(subs(eqnOriginal, x, rootLeft));
fValueRight = double(subs(eqnOriginal, x, rootRight));
fValueMid = double(subs(eqnOriginal, x, midPoint));

plot(subs(x, -5:0.01:5), subs(eqnOriginal, x, -5:0.01:5));
grid on;

%initialise the bisection method
while abs(fValueLeft - fValueRight) > epsilon
    
    if sign(fValueMid) == sign(fValueLeft)
        rootLeft = midPoint;
        
    elseif sign(fValueMid) == sign(fValueRight)
        rootRight = midPoint;
    end
    
    midPoint = (rootLeft + rootRight) / 2;
    fValueLeft = double(subs(eqnOriginal, x, rootLeft));
    fValueRight = double(subs(eqnOriginal, x, rootRight));
    fValueMid = double(subs(eqnOriginal, x, midPoint));
    
    disp(vpa(midPoint, 6));
end

disp('The final root is ');
disp(vpa(midPoint, 6));

