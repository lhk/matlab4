function [  ] = plot_solution( soln, n,pos )

    h = 1.0/n;
    Z = zeros(n-1, n-1);
    for ii=1:n-1
        for jj=1:n-1
            Z(ii,jj) = soln(index_2Dto1D(ii,jj,n));
        end
    end
    
    [X,Y] = meshgrid(linspace(h,1-h,n-1),linspace(h,1-h,n-1));
    surf(X,Y,Z);
    camproj('perspective');
    cameratoolbar('SetMode','orbit');
    %daspect([1 1 1]);
    fig = gcf;
    set (fig, 'Units', 'normalized', 'Position', pos);
    

end

