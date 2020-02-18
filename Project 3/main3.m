% Main 3
clear all
close all
a = 10;
d = 0.01;
tend = 1;
N = 100;
M = 500;
dt = tend/M;
dx = 1/N;

x = linspace(0,1,N+1);
t = linspace(0,tend,M+1);
[xx,tt]=meshgrid(x,t); % Will be used when we plot

uold = exp(-100*(x-0.5).^2); % g(x)
%uold = sin(2*pi*x);
sol = uold;

Pe = abs(a/d) % 1-1000
meshPeNr = Pe*dx % <2
CFL = d*dt/(dx^2);

for i=1:M
    unew = convdif(uold,a,d,dt);
    sol = [sol; unew];
    uold = unew;
end

surf(xx,tt,sol,'EdgeColor','none');
set(gca,'FontSize',15)
ylabel('Time, t');
xlabel('Space, x');