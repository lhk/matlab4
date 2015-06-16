function [ u ] = ImplicitEuler( N,Nt,A,u0,dt )

    u = zeros(N,Nt); % rows = x-index, columns = t-index
    u(:,1) = u0;
    
    ImplEulerMatrix = speye(N,N) - dt*A;
    
    for i=2:Nt
        u(:,i) = ImplEulerMatrix\u(:,i-1);
    end

end

