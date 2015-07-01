function [  ] = A2(  )

    steps=[]
    times=[]
    times_avg=[]
    NS=10:10:80;
    for N=NS
        [A2,b]=poisson2D(N);
        tic;
        [U,steps(end+1)]=GS(A2,b);
        times(end+1)=toc;
        times_avg(end+1)=times(end)/steps(end);
    end
    
    loglog(NS,steps,'b-',NS,steps,'bo',NS,times,'r-',NS,times,'ro',NS,times_avg,'g-',NS,times_avg,'go');
        
end

