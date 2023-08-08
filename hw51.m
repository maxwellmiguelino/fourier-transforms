function X = hw51(x)
% Compute the DFT of the input signal x using the Cooley-Tukey FFT algorithm
N = length(x);
if N == 1
    X = x;
    return % return the value of X and exit the function
end
% Split the input signal into even and odd components
xe = x(1:2:N);
xo = x(2:2:N);
% Recursively compute the FFT of the even and odd components
Xe = hw51(xe);
Xo = hw51(xo);
% Combine the results using the Cooley-Tukey formula
W = exp(-2*pi*1j/N);
W_N2 = W.^(0:N/2-1);
X = [Xe + W_N2.*Xo, Xe + W_N2.*W_N2.*Xo];
% Round the result to the nearest decimal place
X = round(X, 1, 'significant');
disp(X)
end