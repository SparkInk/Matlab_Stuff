% Question 4: Illustration of Newton's method
syms x;
epsilon = 0.01;

eqnOriginal = (x - 3).^2 - 2; % f(x)
eqnDiff = diff(eqnOriginal); % f'(x)

rootFirst = 6; 
rootNext = rootFirst - (subs(eqnOriginal, x, rootFirst))/(subs(eqnDiff, x, rootFirst));
%rootFirst = rootNext;

plot(subs(x, 2:0.01:8), subs(eqnOriginal, x, 2:0.01:8));
grid on;

while abs(rootFirst - rootNext) > epsilon
    
    k = subs(eqnDiff, x, rootFirst); % k - slope
    m = subs(eqnOriginal, x, rootFirst) - k * rootFirst; % m = f(x) - k * x
    tangentLine = k * x + m;

    hold on
    plot(subs(x, 2:0.01:8), subs(tangentLine, x, 2:0.01:8), 'g'); % graph of tangent lines

    rootFirst = rootNext; % replacing the old root with the new one;
    rootNext = rootFirst - (subs(eqnOriginal, x, rootFirst))/(subs(eqnDiff, x, rootFirst)); %x(n+1) = x(n) - f(x) / f'(x)
end

