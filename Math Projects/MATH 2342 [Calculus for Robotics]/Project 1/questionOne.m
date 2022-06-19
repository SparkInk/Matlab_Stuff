% Question 1
syms x

epsilon = 0.0001;

eqnOriginal = 0.25*x^7 + 3*x^4 + 5*x^2 - 12; % f(x)
eqnDiff = diff(eqnOriginal); % f'(x)



% NEWTON'S METHOD ALGORITHM

% variables
newtonRoot = [-3, -1.5, 1.5]; 

newtonCounter = [0, 0, 0];

disp('INITIALISING NEWTONS METHOND');

hold on;
plot(subs(x, -5:0.001:5), subs(eqnOriginal, x, -5:0.001:5));
grid on;

for range = newtonRoot
    
    previousRoot = range;
    
    fValue = subs(eqnOriginal, x, range);
    fPrimeValue = subs(eqnDiff, x, range);
    
    nextRoot = previousRoot - (fValue)/(fPrimeValue);
    
    newtonIndex = find(newtonRoot == range);
    
    while abs(previousRoot - nextRoot) > epsilon
        
        previousRoot = nextRoot;
        
        fValueWhile = double(subs(eqnOriginal, x, previousRoot));
        fPrimeValueWhile = double(subs(eqnDiff, x, previousRoot));
        
        nextRoot = previousRoot - (fValueWhile)/(fPrimeValueWhile);
        
        % number of iterations
        % the index of a root is declared before while loop
        
        newtonCounter(newtonIndex) = newtonCounter(newtonIndex) + 1;
    end
    
    disp('The number of iterations for the root number ');
    disp(newtonIndex); disp('is');
    disp(newtonCounter(newtonIndex));
    disp('The root number');
    disp(newtonIndex); disp('is');
    disp(vpa(nextRoot, 5));
    plot(nextRoot, subs(eqnOriginal, x, nextRoot), 'bx');
end


% BISECTION METHOD ALGORITHM

% variables 
bisectionInterval = [[-3, -2]; [-1.5, -0.5]; [0.5, 1.5]];

bisectionCounter = [0 0 0];

disp('INITIALISING BISECTION METHOD');

for index = 1:3
    
        leftSide = bisectionInterval(index, 1);
        rightSide = bisectionInterval(index, 2);
        midValue = (leftSide + rightSide)/ 2;

        fLeftValue = double(subs(eqnOriginal, x, leftSide));
        fRightValue = double(subs(eqnOriginal, x, rightSide));
        fMidValue = double(subs(eqnOriginal, x, midValue));
       
        % NB: if your compare the left side and right side of our equation
        % in while loop, then it will take less time to find the root,
        % rather than with comparing the function's values at those regions
        while abs(leftSide - rightSide) > epsilon
            if sign(fMidValue) == sign(fLeftValue)
                leftSide = midValue;
            elseif sign(fMidValue) == sign(fRightValue)
                rightSide = midValue;
            end
            
        midValue = vpa(leftSide + rightSide)/ 2;   
        fLeftValue = double(subs(eqnOriginal, x, leftSide));
        fRightValue = double(subs(eqnOriginal, x, rightSide));
        fMidValue = double(subs(eqnOriginal, x, midValue));
        
        bisectionCounter(index) = bisectionCounter(index) + 1;
        end
        
        disp('The number of iterations for the root number ');
        disp(index); disp('is');
        disp(bisectionCounter(index));
        disp('The root number');
        disp(index); disp('is');
        disp(vpa(midValue, 5));
end
