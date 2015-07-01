function [ u, steps ] = JC( A,b )

n=size(A,1);
D_inv=1./diag(A);
LU = -A;
for i=1:n
    LU(i,i)=0;
end

u=zeros(n,1);

steps=0;

while norm(A*u-b,inf)>1e-4
    steps=steps+1;
    u= D_inv .* (LU * u) + D_inv .* b;
    %u=(eye(n)+D*A)*u-D*b;
end

end

