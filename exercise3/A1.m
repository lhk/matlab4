function [  ] = A1(  )

    N = 60;
    dx = 1/(N+1);
    tspan = .5;
    Nt = 40;
    dt = tspan/(Nt+1);
    A=(1/dx^2)*spdiags( repmat([1 -2 1],N,1),[-1 0 1],N,N);
    
    
    x = linspace(dx, dx*N,N);
    u0 = sin(pi*x);
    
    u=ImplicitTrapez(N,Nt,A,u0,dt);
    
    surf2(u);


end

