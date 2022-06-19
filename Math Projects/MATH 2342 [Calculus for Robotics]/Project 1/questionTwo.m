% Question 2
syms t

epsilon = 0.0001;

eqnOriginal = 1000 * exp(-0.05*t^2 + 0.2*t) - 10*t - 200;
eqnDiff = diff(eqnOriginal, t);

plot(0:0.001:10, subs(eqnOriginal, t, 0:0.001:10));
grid on;

rootFirst = 8;

fValue = double(subs(eqnOriginal, t, rootFirst));
fPrimeValue = double(subs(eqnDiff, t, rootFirst));
rootNext = rootFirst - (fValue)/(fPrimeValue);
iterationCount = 0;
while abs(rootNext - rootFirst) > epsilon
   
    rootFirst = rootNext;
    fValue = double(subs(eqnOriginal, t, rootFirst));
    fPrimeValue = double(subs(eqnDiff, t, rootFirst));
    rootNext = rootFirst - (fValue)/(fPrimeValue);
    iterationCount = iterationCount + 1;
end
disp('The time for h(t) = 200 is');
disp(rootNext);
disp('Number of iterations ');
disp(iterationCount);
