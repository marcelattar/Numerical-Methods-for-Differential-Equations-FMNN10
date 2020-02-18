% Main 4
clear all
close all
N = 300;
M = 2000;
d = 0.005;
tend = 1;
dt = tend/M;
dx = 1/N;

x = linspace(0,1,N+1);
t = linspace(0,tend,M+1);
[xx,tt]=meshgrid(x,t); % Will be used when we plot

% Creating Tdx
supT = 1;
diagT = -2;
subT = 1;
T = full(gallery('tridiag',length(x),supT,diagT,subT));
T(end,1) = subT;
T(1,end) = supT;
Tdx = (1/dx^2)*T;


% Creatin Sdx
sup = 1;
diag = 0;
sub = -1;
S = full(gallery('tridiag',length(x),sup,diag,sub));
S(end,1) = -1;
S(1,end) = 1;
Sdx = (1/(2*dx))*S;

CFL = d*dt/(dx^2)

uold = 4*exp(-50*(x-0.5).^2); % g(x)
sol = uold;

for i=1:M
    LW = uold - dt*uold.*(Sdx*uold')' + ((dt^2)/2)*uold.*(uold.*(Tdx*uold')' + 2*((Sdx*uold')').^2);
    I = eye(size(Tdx));
    ru = LW + (d*dt/2)*(Tdx*uold')';
    unew = ((I - (d*dt/2)*Tdx)\ru')';
    sol = [sol; unew];
    uold = unew;
    
end

surf(xx,tt,sol,'EdgeColor','none');
set(gca,'FontSize',15)
ylabel('Time, t');
xlabel('Space, x');