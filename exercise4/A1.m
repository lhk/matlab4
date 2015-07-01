function [  ] = A1(  )

    N=20;
    [A2,b]=poisson2D(N);
    
    [U,steps]=GS(A2,b);
    %U=A2\b;
    
    surf2(reshape(U,N,N));
        
end

