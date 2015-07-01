function [ A2,b ] = poisson2D( N )


    

    u0=zeros(N*N,1);
    N2 = N*N;
    dx = 1/(N+1);
    A=-(1/dx^2)*spdiags( repmat([1 -2 1],N,1),[-1 0 1],N,N);
    I = speye(N,N);
    A2 = kron(A,I)+kron(I,A);
    
    b = -4*ones(N2,1);
    grid = linspace(dx,1-dx,N)';
    b(1:N) = b(1:N) + (1/dx^2) * grid.^2;
    b(1:N:N*N) = b(1:N:N*N) + (1/dx^2) * grid.^2;
    b(N:N:N^2) = b(N:N:N^2) + (1/dx^2) * (grid.^2+1);
    b(N^2-N+1:N^2) = b(N^2-N+1:N^2) + (1/dx^2) * (grid.^2+1);
    
        


end

