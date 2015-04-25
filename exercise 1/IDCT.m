function [ A ] = IDCT( D,x,y )
% evaluate DCT on x,y Grid


n=length(x);
m=length(y);
A=zeros(n,m);

[N,M]=size(D);

% außen die Iteration über x und y
for j_hat=1:n
    for k_hat=1:m
        
        % innen die Iteration über d_kj
        % j_bar und k_bar sind die indizes aus der formel
        for j_bar=1:N
            for k_bar=1:M
                c_j=1;
                c_k=1;
                if(j_bar-1==0)
                    c_j=1/2;
                end
                if(k_bar-1==0)
                    c_k=1/2;
                end
                
                A(j_hat,k_hat)=A(j_hat,k_hat)+ D(j_bar,k_bar)*c_j*c_k*cos((j_bar-1)*x(j_hat))*cos((k_bar-1)*y(k_hat));
            end
        end
    end
end

