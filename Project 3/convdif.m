function unew = convdif(u,a,d,dt)

N = length(u);
dx = 1/N;
sub = d/dx^2 + a/(2*dx);
diag = -2*d/dx^2;
sup = d/dx^2 - a/(2*dx);

T = full(gallery('tridiag',N,sup,diag,sub));
T(N,1) = sub;
T(1,N) = sup;

unew = TRstep(T,u,dt);

end