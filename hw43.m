function [y] = hw43(numtf, dentf, coeffExp, powExp, T)
    % Load the Control System Toolbox
    addpath(genpath(fullfile(matlabroot,'toolbox','control')))

    % Define time vector for simulation
    t = T(1):T(length(T));
    
    % Define transfer function using numerator and denominator coefficients
    sys = tf(numtf, dentf);
    
    % Define input signal as a linear combination of exponential functions
    u = zeros(size(t));
    for i = 1:length(coeffExp)
        u = u + coeffExp(i) * exp(powExp(i) * t);
    end
    
    % Simulate system response to input signal
    y = lsim(sys, u, t);
end