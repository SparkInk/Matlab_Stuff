% Thermistor model: R = R0 * exp[beta*(T^-1 - T0^-1))]
% Plot the resistance-temperature characteristic from 0 to 100 degrees
function thermistor(T0, R0, beta)
    T0kelvin = T0 + 273.15;
    ii = 0;
    for t = 0:100
        T = t + 273.15;
        ii = ii + 1;
        R(ii) = R0 * exp(beta * (1/T - 1/T0kelvin));

    end
plot(0:100, R);
end 