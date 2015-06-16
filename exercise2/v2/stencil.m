function [ center, left, right, top, bottom  ] = stencil( upwind, beta, epsilon, epsilon2, h )

    cosb = epsilon2*cos(beta);
    sinb = epsilon2*sin(beta);
    
    h2 = h*h;
    
    if upwind
        if cosb >= 0 && sinb >= 0
            center = 4*epsilon/h2 + sinb/h + cosb/h;
            left = -epsilon/h2 - cosb/h;
            right = -epsilon/h2;
            bottom = -epsilon/h^2 - sinb/h;
            top = -epsilon/h2;
        elseif cosb < 0 && sinb >= 0
            center = 4*epsilon/h2 + sinb/h - cosb/h;
            left = -epsilon/h2;
            right = -epsilon/h2 + cosb/h;
            bottom = -epsilon/h^2 - sinb/h;
            top = -epsilon/h2;
        elseif cosb >= 0 && sinb < 0
            center = 4*epsilon/h2 - sinb/h + cosb/h;
            left = -epsilon/h2 - cosb/h;
            right = -epsilon/h2;
            bottom = -epsilon/h^2;
            top = -epsilon/h2 + sinb/h;
        else
            center = 4*epsilon/h2 - sinb/h - cosb/h;
            left = -epsilon/h2;
            right = -epsilon/h2 + cosb/h;
            bottom = -epsilon/h^2;
            top = -epsilon/h2 + sinb/h;
        end
    else
        center = 4*epsilon/h2;
        left = -epsilon/h2 - cosb/2/h;
        right = -epsilon/h2 + cosb/2/h;
        bottom = -epsilon/h2 - sinb/2/h;
        top = -epsilon/h2 + sinb/2/h;
    end

end

