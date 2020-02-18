function [approx,err] = eulerint(A, y0, t0, tf, N)
    
    k = length(A);
    %yold = zeros(k,k);
    %ynew = y0;
    
    %Approx
    steglangd = (tf - t0)/N;
    yold = y0;
    ynew = 0;
    for n = 1:(N);
        ynew = eulerstep(A, yold, steglangd);
        yold = ynew;
    end
    approx = ynew;
    
    %Err
    trueval=expm(A*(tf-t0))*y0;
    err = norm(approx - trueval);
    
end