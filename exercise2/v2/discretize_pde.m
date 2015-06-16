function [ A, rhs ] = discretize_pde( n, epsilon,epsilon2, beta, f, g, upwind )

    rhs=zeros((n-1)^2,1);
    h=1.0/n;
    [ center, left, right, top, bottom  ] = stencil( upwind, beta, epsilon, epsilon2, h );
    A = zeros((n-1)^2,(n-1)^2);
    
    T = diag(center*ones(n-1,1))+diag(left*ones(n-2,1),-1)+diag(right*ones(n-2,1),1);
    
    Top = top*eye(n-1,n-1);
    Bottom = bottom*eye(n-1,n-1);
    
    for ii=1:n-1
        A( (ii-1)*(n-1)+1:(ii-1)*(n-1)+1+n-2,(ii-1)*(n-1)+1:(ii-1)*(n-1)+1+n-2 ) = T;
    end
    for ii=1:n-2
        A( (ii-1)*(n-1)+1:(ii-1)*(n-1)+1+n-2 , (ii)*(n-1)+1:(ii)*(n-1)+1+n-2 ) = Top;
    end
    for ii=1:n-2
        A( (ii)*(n-1)+1:(ii)*(n-1)+1+n-2 , (ii-1)*(n-1)+1:(ii-1)*(n-1)+1+n-2 ) = Bottom;
    end
    
    %% evaluate f
    for ii=1:n-1
        for jj=1:n-1
            rhs(index_2Dto1D(ii,jj,n))=f(ii,jj);
        end
    end
    
    % left border 
    for ii=1:n-1
        rhs(index_2Dto1D(ii,1,n))=rhs(index_2Dto1D(ii,1,n))-left*g(ii*h,0);
    end
    
    % right border
    for ii=1:n-1
        rhs(index_2Dto1D(ii,n-1,n))=rhs(index_2Dto1D(ii,n-1,n))-right*g(ii*h,1);
    end
    
    % lower border
    for jj=1:n-1
        rhs(index_2Dto1D(1,jj,n))=rhs(index_2Dto1D(1,jj,n))-bottom*g(0,jj*h);
    end
    
    % upper border
    for jj=1:n-1
        rhs(index_2Dto1D(n-1,jj,n))=rhs(index_2Dto1D(n-1,jj,n))-top*g(1,jj*h);
    end
end

