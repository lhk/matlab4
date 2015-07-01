function [ u ] = ImplicitTrapez( N,Nt,A,b,u0,dt )

    u = zeros(N,Nt); % rows = x-index, columns = t-index
    u(:,1) = u0;
    
    TrapzMatrix = speye(N,N) - ((dt/2)*A);
    
    for i=2:Nt
        u(:,i) = TrapzMatrix\(u(:,i-1) + dt*b + (dt/2)*(A*u(:,i-1)));
    end
    
end
