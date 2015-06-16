function [  ] = A2a(  )

    
    load penny;
    P=flipud(P);
    P=imresize(P,0.2);
    [nP,mP]=size(P);
    assert(nP==mP);
    u0=reshape(P,nP*mP,1);
    

    N = nP;
    N2 = N*N;
    dx = 1/(N+1);
    dt = 0.5;
    A=(1/dx^2)*spdiags( repmat([1 -2 1],N,1),[-1 0 1],N,N);
    I = speye(N,N);
    A2 = kron(A,I)+kron(I,A);
    
    U = ImplicitTrapez( N2,10,A2,u0,dt );
    


end

