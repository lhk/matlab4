function [ k ] = index_2Dto1D( i, j, n )

    assert(i>=1);
    assert(j>=1);
    assert(i<=n-1);
    assert(j<=n-1);
    
    k = (i-1)*(n-1)+j;
    
    assert(k>=1);
    assert(k<=(n-1)^2);


end

