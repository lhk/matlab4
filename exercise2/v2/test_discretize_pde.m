function [  ] = test_discretize_pde(  )

    n = 20;
    [ spA, f ] = discretize_pde( n, 1e-2, 1, 5*pi/6, @(x,y) -1, @(x,y) 0, true );
    
    %soln = spA\f;
    %max(soln)
    %soln = soln *(1/ max(abs(soln)));
    %plot_solution(soln,n);
    

end

