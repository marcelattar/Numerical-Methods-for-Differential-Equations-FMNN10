function [tvector,ymatrix] = adaptiveRK34(f, y0, t0, tf, tol)

%for l=1:length(y0)
n=1e5;
i=1;
tvector= zeros(n,1);
ymatrix = zeros(n,length(y0));
tvector(1) = t0;
ymatrix(i,:) = y0;
k=4;
h0 = (norm(tf-t0)*tol^(1/4))/(100*(1+norm(f(t0,y0))));

[unew,err] = RK34step(f,ymatrix(1),tvector(1),h0);

while tvector(i) < tf;
    errold = err;
    [unew,err] = RK34step(f,ymatrix(i),tvector(i),h0);
    ymatrix(i+1) = unew;
    tvector(i+1) = tvector(i) + h0;
    h0 = newstep(tol, err, errold, h0, k);
    i=i+1;
end

[ulast,errlast] = RK34step(f,ymatrix(i-1),tf,tf-tvector(i-1));
tvector(i)=tf;
ymatrix(i)= ulast;

%end

end