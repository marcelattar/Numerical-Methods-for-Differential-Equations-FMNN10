function unew = viscBurger(uold,d,dt, N)
dx = 1/N;
Sdx = (diag(ones(N-1,1),-1) + diag(zeros(N,1),0) + diag(-ones(N-1,1),1))./(2*dx);
Sdx(1,N) = 1/(2*dx);
Sdx(N,1) = -1/(2*dx);
Tdx = (diag(ones(N-1,1),-1) + diag(-2*ones(N,1),0) + diag(ones(N-1,1),1))./(dx^2);
Tdx(1,N) = 1/(dx^2);
Tdx(N,1) = 1/(dx^2);
LW = uold' - dt*uold'.*(Sdx*uold') + ((dt^2)/2)*uold'.*(uold'.*(Tdx*uold') + 2*(Sdx*uold').^2);
I = eye(size(Tdx));
unew = (I-d*(dt/2)*Tdx)\(LW + d*(dt/2)*Tdx*uold');
end