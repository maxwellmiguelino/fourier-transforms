function a = hw3_fft(x, N)
% Cooley-Tukey FFT algorithm
% x - input sequence
% N - length of input sequence
% a - output sequence

if N > 1
    x_e = x(1:2:end); % even-indexed samples
    x_o = x(2:2:end); % odd-indexed samples
    a = zeros(N); % pre-allocating zeros
    b = hw3_fft(x_e, N/2); % recursive call for even-indexed samples
    c = hw3_fft(x_o, N/2); % recursive call for odd-indexed samples
    for k = 1:N/2
        t = exp(-2i*pi(k-1)/N)*c(k); % Twiddle factor
        a(k) = b(k) + t;
        a(k + N/2) = b(k) - t;
    end

else % N = 1, base case
    a = x; 
end

end