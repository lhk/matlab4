function A1()


    % eps = 1
    n = 60;
    [ spA, f ] = discretize_pde( n, 1, 1, 5*pi/6, @(x,y) 1, @(x,y) 0, true );
    soln = spA\f;
    figure(1);
    plot_solution(soln,n,[.1-0.05,.05,.3,.8]);
    
    % eps = 1e-2
    n = 60;
    [ spA, f ] = discretize_pde( n, 1e-2, 1, 5*pi/6, @(x,y) 1, @(x,y) 0, true );
    soln = spA\f;
    figure(2);
    plot_solution(soln,n,[.4-0.05,.05,.3,.8]);
    
    % eps = 1e-4
    n = 60;
    [ spA, f ] = discretize_pde( n, 1e-4, 1, 5*pi/6, @(x,y) 1, @(x,y) 0, true );
    soln = spA\f;
    figure(3);
    plot_solution(1e-40*soln,n,[.7-0.05,.05,.3,.8]);


end

