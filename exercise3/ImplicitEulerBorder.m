function [ u ] = ImplicitEulerBorder( N,Nt,A,u0,dt )

    u = zeros(N,Nt); % rows = x-index, columns = t-index
    u(:,1) = u0;
    
    ImplEulerMatrix = speye(N,N) - dt*A;
    
    N_s=sqrt(N);
    u0_shaped=reshape(u0,N_s,N_s);
    
    for i=2:Nt
        u(:,i) = ImplEulerMatrix\u(:,i-1);
        
        u_temp=reshape(u(:,i),N_s,N_s);
        
        u_temp(:,1)=u0_shaped(:,1);
        u_temp(:,N_s)=u0_shaped(:,N_s);
        u_temp(1,:)=u0_shaped(1,:);
        u_temp(N_s,:)=u0_shaped(N_s,:);
        
        u(:,i)=reshape(u_temp,N_s*N_s,1);
        
    end

end

