% Task 2.1
clear all
close all
a = 1;
tend = 5;
N = 90;
M = 500;

x = linspace(0,1,N+1);
t = linspace(0,tend,M+1);

[xx,tt]=meshgrid(x,t); % Will be used when we plot

uold = exp(-100*(x-0.5).^2);
sol = uold;

dx = 1/(N);
dt = tend/M;

mu = dt/dx;
amu = a*mu;

CFL = amu % <=1/2
normvec=[norm(sol)];

for i=1:M
   unew = LaxWen(uold,amu);
   sol = [sol; unew];
   normvec(i+1)=norm(unew);
   uold = unew;
    
end

figure
surf(xx,tt,sol,'EdgeColor','none');
set(gca,'FontSize',15)
ylabel('Time, t');
xlabel('Space, x');

hold on

l2norm =(1/sqrt(N))*normvec;

figure
plot(t,l2norm);
set(gca,'FontSize',15)
xlabel('time, t');
ylabel('L^2 norm');


