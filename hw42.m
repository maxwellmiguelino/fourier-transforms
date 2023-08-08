function [conv_zero_filter] = hw42(x, h)
    % Extract time points and signals from input arguments
    t_x = x(1,:);
    x = x(2,:);
    t_h = h(1,:);
    h = h(2,:);
    
    % Compute convolution of input and impulse response
    y = conv(x, h);
    
    % Compute time points for output
    t_y = linspace(t_x(1)+t_h(1), t_x(end)+t_h(end), length(y));
    
    % Combine time points and output values into output matrix
    y = [t_y; y];
    
    % Remove time points with corresponding output values of 0
    conv_zero_filter = y(:, y(2,:) ~= 0);
    disp(conv_zero_filter)
end