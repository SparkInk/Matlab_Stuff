%{
    Name: trapezium
    Description: trapezium computes an integral of a function 
                 using the Trapezium method, and returns the total sum 
    Inputs: Integrand; left side of the integral; right side of the
    integral
    Outputs: Integral of the entered equation (by disp() function)
    Returns: The total sum of integration
    Date created: 30.04.2021
    Authors: Iakov, Zarina, Ethan, Cameron aka IZEC
%}

function [trapezium] = trapezium(equation, leftSide, rightSide)

    syms t
    subsEqu = equation;
    
    % prelimenary sums integrand0, integrandN, integradOthers
    integrand0 = 0;
    integrandN = 0;
    integrandOthers = 0;
    
     % the height of a trapezium; also the interval betwee x(i+1) and x(i)
    interval = 0.01;
    
    size = (rightSide - leftSide) / interval;
    
    for i = 0:(size-1) 
       if i == 0
           integrand0 = 0.5 * interval * double(subs(subsEqu, t, leftSide));
       elseif i == (size - 1)
           integrandN = 0.5 * interval * double(subs(subsEqu, t, rightSide));
       else 
           integrandOthers = integrandOthers + interval * double(subs(subsEqu, t, leftSide + interval * (i+1)));
       end
    end
    
    trapezium = integrand0 + integrandOthers + integrandN;
end