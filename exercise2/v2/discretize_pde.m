function [ A, rhs ] = discretize_pde( n, epsilon,epsilon2, beta, f, g, upwind )

    rhs=0;
    h=1.0/n;
    [ center, left, right, top, bottom  ] = stencil( upwind, beta, epsilon, epsilon2, h );
    A = zeros((n-1)^2,(n-1)^2);
    
    T = diag(center*ones(5,1))+diag(left*ones(4,1),-1)+diag(right*ones(4,1),1);
    T
    

end

