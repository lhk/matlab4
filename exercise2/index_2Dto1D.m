function [ k ] = index_2Dto1D( i, j, n )

    assert(i>=0);
    assert(j>=0);
    assert(i<=n);
    assert(j<=n);
    
    k = i*(n+1)+j+1;
    
    assert(k>=1);
    assert(k<=(n+1)^2);


end

