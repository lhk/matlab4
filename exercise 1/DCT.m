function [ D ] = DCT( F )
%DCT Direct cosinus transformation
%   F is a matrix of evaluations of the 2D function on a grid of
%   [0,2*pi]<[0,2*pi]

[N,M]=size(F);
x=linspace(1/(2*N)*pi,pi-1/(2*N)*pi,N);
y=linspace(1/(2*M)*pi,pi-1/(2*M)*pi,M);

D=zeros(N,M);

for j_hat=1:N
    for k_hat=1:M
        % calculate the d_ij
        D(j_hat,k_hat)=0;
        
        % this loop works like a sum
        for j_bar=1:N
            for k_bar=1:M
                D(j_hat,k_hat)=D(j_hat,k_hat) + 4/(N*M) * F(j_bar,k_bar) * cos((j_hat-1)*x(j_bar))*cos((k_hat-1)*y(k_bar));
            end
        end
    end
end