function [  ] = testIndex(  )

    n=50;
    prev = 0;
    for i=0:n
        for j=0:n
            current = index_2Dto1D(i,j,n);
            assert(prev+1==current,sprintf('%i, %i, %i, %i',i,j,prev,current));
            
            [inv_i,inv_j]=index_1Dto2D(current,n);
            assert(i==inv_i,sprintf('%i, %i, %i, %i',i,j,inv_i,inv_j,current));
            assert(j==inv_j,sprintf('%i, %i, %i, %i',i,j,inv_i,inv_j,current));
            
            prev=current;
        end
    end


end

