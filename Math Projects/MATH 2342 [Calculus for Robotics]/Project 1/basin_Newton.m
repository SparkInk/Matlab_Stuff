% Question 5: basin of Attraction
syms x;

% root 1 = -3 - red
% root 2 = 1 - blue
% root 3 = 4 - green
% extreme value 0 - black

eqnOriginal = x.^3 - 2 * x.^2 - 11 * x + 12; % f(x)
eqnDiff = diff(eqnOriginal); % f'(x)

intervalX = -6:0.1:6;

plot(intervalX, subs(eqnOriginal, x, intervalX));
grid on;

for discreteInterval = -6:0.06:6 % freezes below 0.06
    
    root = discreteInterval;
    
    if round(subs(eqnDiff, x, root)) == 0
       hold on;
       plot(discreteInterval, 0, 'k.','MarkerSize', 15);
       continue
    else
        newRoot = root - subs(eqnOriginal, x, root) / subs(eqnDiff, x, root);
        while abs(root - newRoot) > 0.1
          root = newRoot;
          newRoot = root - subs(eqnOriginal, x, root) / subs(eqnDiff, x, root);
        end
    end
    
    
    if round(newRoot) == -3
       hold on;
       plot(discreteInterval, 0, 'r.','MarkerSize', 15);
    elseif round(newRoot) == 1
       hold on;
       plot(discreteInterval, 0, 'b.','MarkerSize', 15);
    elseif round(newRoot) == 4
       hold on;
       plot(discreteInterval, 0, 'g.','MarkerSize', 15);
    else 
        continue;
    end
    
end