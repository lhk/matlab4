
function [ u ] = ImplicitTrapezBorder( N,Nt,A,u0,dt )

    u = zeros(N,Nt); % rows = x-index, columns = t-index
    u(:,1) = u0;
    
    TrapzMatrix = speye(N,N) - ((dt/2)*A);
    
    N_s=sqrt(N);
    u0_shaped=reshape(u0,N_s,N_s);
    
    for i=2:Nt
        u(1,i-1)
        u0(1)
        u(:,i) = TrapzMatrix\(u(:,i-1) + (dt/2)*(A*u(:,i-1)));
        
        
        u_temp=reshape(u(:,i),N_s,N_s);
        
        u_temp(:,1)=u0_shaped(:,1);
        u_temp(:,N_s)=u0_shaped(:,N_s);
        u_temp(1,:)=u0_shaped(1,:);
        u_temp(N_s,:)=u0_shaped(N_s,:);
        
        u(:,i)=reshape(u_temp,N_s*N_s,1);
    end
    
end

