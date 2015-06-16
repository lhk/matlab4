function [ u ] = ImplicitTrapez( N,Nt,A,u0,dt )

    u = zeros(N,Nt); % rows = x-index, columns = t-index
    u(:,1) = u0;
    
    TrapzMatrixL = speye(N,N) - dt/2*A;
    TrapzMatrixR = speye(N,N) + dt/2*A;
    
    for i=2:Nt
        u(:,i) = TrapzMatrixL\(TrapzMatrixR*u(:,i-1));
    end
    
end

