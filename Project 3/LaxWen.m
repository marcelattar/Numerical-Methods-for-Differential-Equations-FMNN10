function unew = LaxWen(u,amu)

a = (amu/2)*(1+amu);
b = (1-amu^2);
c = -(amu/2)*(1-amu);
N = length(u);

T = full(gallery('tridiag',N,a,b,c));

T(N,1) = (amu/2)*(amu-1);
T(1,N) = (amu/2)*(amu+1);

unew = (T*u')';

end