function A3()

    f = @(x,y) -4;
    g = @(x,y) x^2+y^2;

    % eps = 1
    n = 60;
    [ spA, rhs ] = discretize_pde( n, 1, 0, 5*pi/6, f, g, false );
    soln = spA\rhs;
    figure(1);
    plot_solution(soln,n,[.1-0.05,.05,.3,.8]);
    
    % eps = 1e-2
    n = 60;
    [ spA, rhs ] = discretize_pde( n, 1e-2, 0, 5*pi/6, f, g, false );
    soln = spA\rhs;
    figure(2);
    plot_solution(soln,n,[.4-0.05,.05,.3,.8]);
    
    % eps = 1e-4
    n = 60;
    [ spA, rhs ] = discretize_pde( n, 1e-4, 0, 5*pi/6, f, g, false );
    soln = spA\rhs;
    figure(3);
    plot_solution(soln,n,[.7-0.05,.05,.3,.8]);


end

