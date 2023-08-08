function [convolution] = hw41(signal_1, signal_2)
if length(signal_1)<=length(signal_2)
    xn = signal_1;
    hn = signal_2;
else
    xn = signal_2;
    hn = signal_1;
end

length_yn = length(xn) + length(hn) - 1;
yn_temp = zeros(length(xn),length(hn)); % empty square matrix

% create our multiplication matrix
for i=1:length(xn)
    for j=1:length(hn)
        yn_temp(i,j) = hn(j).*xn(i);
    end
end

% Get the number of rows and columns of the matrix
[nRows, nCols] = size(yn_temp);

% find max dimensions for creating a zero matrix containing temp_yn
max_dim = max(nRows, nCols);

% Initialize a square matrix with zeros
yn_square = zeros(max_dim);

% Copy the non-square matrix to the upper-left corner of the square matrix
yn_square(1:nRows, 1:nCols) = yn_temp;

% flip matrix for finding diagonals
yn_square = flip(yn_square);

% Get the number of rows and columns of the new matrix
[nRows, nCols] = size(yn_temp);

z = 1;
for k=1-nCols:nRows-1
    diagonal = diag(yn_square, k);
    yn(z) = sum(diagonal(:));
    z = z+1;
    
end

convolution = yn;
disp(convolution);