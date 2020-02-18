function [approx,err] = eulerintarea(A, y0, t0, tf, N)
    steglangd = (tf - t0)/N;
    yold = y0;
    area = 0;
    for n = 1:(N-1);
        ynew = eulerstep(A, yold, steglangd);
        yold = ynew;
        delarea = ynew*steglangd;
        area = area + delarea;
    end
    approx = area;
end