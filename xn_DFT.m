function Xn=xn_DFT(ak,N)

L = length (ak);
j = 1i; % imaginary denotation

if(N<L)
    error ('required: N >= length x')
end

ak=[ak zeros(1,N-L)]; % padding vector x
Xn=zeros(1,N); 

% explicit summation (1) from HW2
for k=0:N-1
    for n=0:N-1
        Xn(k)=Xn(k)+ak(n)*exp(-j*2*pi*k*n/N);
    end
end

end