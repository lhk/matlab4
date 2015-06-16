function [  ] = A1(  )

    N = 60;
    dx = 1/(N+1);
    tspan = 5;
    dt = tspan/(N+1);
    A=(1/dx^2)*spdiags( repmat([1 -2 1],N,1),[-1 0 1],N,N);
    
    
    x = linspace(dx, dx*N,N);
    u0 = sin(pi*x);
    
    u=ImplicitTrapez(N,N,A,u0,dt);
    
    surf(u)
    camproj('perspective');
    cameratoolbar('SetMode','orbit');
    %daspect([1 1 1]);
    fig = gcf;
    set (fig, 'Units', 'normalized', 'Position', [.1-0.05,.05,.7,.8]);


end

