function diffSolver(tend, N, M)

xx = linspace(0,1,N+2);
tt = linspace(0,tend,M+1);
[x,t]=meshgrid(xx,tt'); % Will be used when we plot
xint = xx(2:N+1); % int stands for interior.


dx = 1/(N+1);
dt = tend/M;
T = full(gallery('tridiag',N,1,-2,1));
Tdx = (1/dx^2)*T;

CFL = dt/(dx^2) % 1/2

sol = 1-2*abs(xint-0.5); % sol = u(0,x) = g(x)
%sol = sin(2*pi*xint);
uold = sol;

for i = 1:M
   %unew = eulerstep(Tdx,uold,dt); % Eulerstep method
   unew = TRstep(Tdx,uold,dt);     % Crank-Nicolsen method
   sol = [sol; unew];
   uold = unew;
end

sol = [zeros(1,length(tt))' sol zeros(1,length(tt))']; % Appends the boundary values
surf(x,t,sol,'EdgeColor','none');
set(gca,'FontSize',15)
ylabel('Time, t');
xlabel('Space, x');

end