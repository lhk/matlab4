function [  ] = testIndex(  )

    n=50;
    prev = 0;
    for i=1:n-1
        for j=1:n-1
            current = index_2Dto1D(i,j,n);
            assert(prev+1==current,sprintf('%i, %i, %i, %i',i,j,prev,current));
            prev=current;
        end
    end


end

