function [  ] = test_discretize_pde(  )
    clc
    n = 15;
    [ A, rhs ] = discretize_pde( n, 1e-2, 1, 5*pi/6, @(x,y) -1, @(x,y) 0, true );
    
    %spy(sparse(A));
    
    soln = A\rhs;
    %max(soln)
    %soln = soln *(1/ max(abs(soln)));
    plot_solution(soln,n);
    

end

