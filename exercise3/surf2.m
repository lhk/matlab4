function  surf2( U )

    surf(U)
    camproj('perspective');
    cameratoolbar('SetMode','orbit');
    %daspect([1 1 1]);
    fig = gcf;
    set (fig, 'Units', 'normalized', 'Position', [.1-0.05,.05,.7,.8]);

end

