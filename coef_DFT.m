function ak=coef_DFT(x,N)

L = length (x);
j = 1i; % imaginary denotation

if(N<L)
    error ('required: N >= length x')
end

x=[x zeros(1,N-L)]; % padding vector x
ak=zeros(1,N); 

% explicit summation (2) from HW2
for k=1:N
    for n=1:N
        ak(k)=ak(k)+x(n)*exp(-j*2*pi*k*n/N);
    end
end

ak = (1/N)*ak; % external factor of 1/N

end