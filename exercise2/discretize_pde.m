function [ spA, rhs ] = discretize_pde( n, epsilon,epsilon2, beta, f, g, upwind )

    equation_counter = 1;
    IJV = [];
    rhs = [];
    h=1.0/n;
    
    cosb = epsilon2*cos(beta);
    sinb = epsilon2*sin(beta);
    
    % interior finite difference equations
    for ii=1:n-1
        for jj=1:n-1
            if ~upwind % central differences
                % center
                IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,jj,n) -4*epsilon/h^2]; 
                
                % "star"
                IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii-1,jj,n) epsilon/h^2 - cosb/2/h];
                IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii+1,jj,n) epsilon/h^2 + cosb/2/h];
                IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,jj-1,n) epsilon/h^2 - sinb/2/h];
                IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,jj+1,n) epsilon/h^2 + sinb/2/h];
            else % 'upwind' differences
                if cosb >= 0
                    % center
                    IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,jj,n) -4*epsilon/h^2 + cosb/h + sinb/h]; 

                    % "star"
                    IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii-1,jj,n) epsilon/h^2 - cosb/h];
                    IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii+1,jj,n) epsilon/h^2];
                    IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,jj-1,n) epsilon/h^2 - sinb/h];
                    IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,jj+1,n) epsilon/h^2];

                else
                    
                    % center
                    IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,jj,n) -4*epsilon/h^2 - cosb/h - sinb/h]; 

                    % "star"
                    IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii-1,jj,n) epsilon/h^2];
                    IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii+1,jj,n) epsilon/h^2 + cosb/h];
                    IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,jj-1,n) epsilon/h^2];
                    IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,jj+1,n) epsilon/h^2 + sinb/h];
                end
            end
            
            % rhs
            rhs(end+1,1) = f(ii*h, jj*h);
            equation_counter=equation_counter+1;
        end
    end
    
    
    % boundary conditions
    for ii=0:n
        % bottom
        IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,0,n) 1];
        rhs(end+1,1) = g(ii*h,0);
        equation_counter=equation_counter+1;
        
        % top
        IJV(end+1,1:3) = [equation_counter index_2Dto1D(ii,n,n) 1];
        rhs(end+1,1) = g(ii*h,1);
        equation_counter=equation_counter+1;
        
        % left
        IJV(end+1,1:3) = [equation_counter index_2Dto1D(0,ii,n) 1];
        rhs(end+1,1) = g(0, ii*h);
        equation_counter=equation_counter+1;
        
        % right
        IJV(end+1,1:3) = [equation_counter index_2Dto1D(n,ii,n) 1];
        rhs(end+1,1) = g(1, ii*h);
        equation_counter=equation_counter+1;
        
    end

    spA = sparse(IJV(:,1),IJV(:,2),IJV(:,3));
end

