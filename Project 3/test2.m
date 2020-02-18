clear all
close all
tend = 0.1;
N = 30;
M = 400;

xx = linspace(0,1,N+2);
tt = linspace(0,tend,M+1);
[x,t]=meshgrid(xx,tt'); % Will be used when we plot
xint = xx(2:N+1); % int stands for interior.


dx = 1/(N+1);
dt = tend/M;
T = full(gallery('tridiag',N,1,-2,1));
Tdx = (1/dx^2)*T;

sol = 1-2*abs(xint-0.5); % sol = u(0,x) = g(x)
uold = sol;

for i = 1:M
   unew = eulerstep(Tdx,uold,dt); %uold + dt*Tdx*uold;
   sol = [sol; unew];
   uold = unew;
end

sol = [zeros(1,length(tt))' sol zeros(1,length(tt))'];
surf(x,t,sol);