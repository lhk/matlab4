function [  ] = plot_solution( soln, n,pos )

    Z = zeros(n+1, n+1);
    for ii=0:n
        for jj=0:n
            Z(ii+1,jj+1) = soln(index_2Dto1D(ii,jj,n));
        end
    end
    
    [X,Y] = meshgrid(linspace(0,1,n+1),linspace(0,1,n+1));
    surf(X,Y,Z);
    camproj('perspective');
    cameratoolbar('SetMode','orbit');
    %daspect([1 1 1]);
    fig = gcf;
    set (fig, 'Units', 'normalized', 'Position', pos);
    

end

