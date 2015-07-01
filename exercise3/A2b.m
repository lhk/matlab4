function [  ] = A2b(  )

    
    load penny;
    P=flipud(P);
    P=imresize(P,0.6);
    [nP,mP]=size(P);
    assert(nP==mP);
    u0=reshape(P,nP*mP,1);
    

    N = nP
    N2 = N*N;
    Nt=40;
    dx = 1/(N+1);
    dt = 1e-5;
    A=(1/dx^2)*spdiags( repmat([1 -2 1],N,1),[-1 0 1],N,N);
    I = speye(N,N);
    A2 = kron(A,I)+kron(I,A);
    
    U = ImplicitTrapezBorder( N2,Nt,A2,u0,dt )';    
    %[T,U] = ode15s(@(t,x) A2*x, linspace(0,dt*Nt,Nt+1), u0);
    
    
    surf2(U);
        
    for t=1:Nt
        x = reshape(U(t,:),N,N);
        contour(x,1:15:255);
        pause(0.1);
    end


end

