function [ i,j ] = index_1Dto2D( k, n )

    
    assert(k>=1);
    assert(k<=(n+1)^2);

    j = mod(k,n+1)-1;
    i = floor((k-1)/(n+1));
    if j == -1
        j=n;
    end

    assert(i>=0);
    assert(j>=0);
    assert(i<=n);
    assert(j<=n);
end

