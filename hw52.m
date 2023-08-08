function y = hw52(x, thres)
% Compute the Haar wavelet transform of the given signal x
% and apply a threshold to the wavelet coefficients

% Get the length of the input signal
N = length(x);

% Define the Haar wavelet vectors
w0 = ones(1, N);
w = zeros(log2(N), N);
for j = 1:log2(N)
    for k = 1:2^(j-1)
        idx = (2*k-2)*(N/2^j) + 1 : (2*k-1)*(N/2^j);
        w(j, idx) = ones(1, length(idx));
        idx = (2*k-1)*(N/2^j) + 1 : 2*k*(N/2^j);
        w(j, idx) = -ones(1, length(idx));
    end
end

% Compute the wavelet coefficients
lam = zeros(log2(N)+1, N);
lam(1,:) = x*w0';
for j = 1:log2(N)
    lam(j+1,:) = x*w(j,:)';
end

% Apply thresholding to the wavelet coefficients
lam_abs = abs(lam);
lam_max = max(max(lam_abs));
lam_bar = lam_abs - thres*lam_max;
lam_bar(lam_bar<0) = 0;
lam_bar = lam_bar.*sign(lam);
lam_bar(1,:) = lam(1,:); % preserve the DC coefficient

% Reconstruct the signal using the filtered coefficients
y = zeros(1, N);
for j = 1:log2(N)
    y = y + 2^(j/2-1)*lam_bar(j+1,:)*w(j,:);
end
y = y + lam_bar(1,:)*w0';
end
