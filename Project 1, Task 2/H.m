function [x,y,t] = H(f,u,t0,tf,tol)

[T,X]=adaptiveRK34(f(1), u(1), t0, tf, tol);
[T,Y]=adaptiveRK34(f(2), u(2), t0, tf, tol);

end