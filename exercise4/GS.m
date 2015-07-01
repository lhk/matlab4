function [ u, steps ] = GS( A,b )

n=size(A,1);
LD=tril(A,0);
U=triu(-A,1);

u=zeros(n,1);

steps=0;

while norm(A*u-b,inf)>1e-4
   u=LD\(U*u+b); 
   steps=steps+1;
end

end

