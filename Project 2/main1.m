%% Task 1.1a, plot a function
clear all;
N = 100;
alpha = 0;
beta = 0;
L = pi;
f = fvec(L,N);

y = twopBVP(f, alpha, beta, L, N);
y = [alpha; y; beta];
x = 0:L/(N+1):L;

plot(x,y')
grid on;
set(gca,'FontSize',15)
xlabel('x');
ylabel('y(x)');
%% Task 1.1b, plot the error
clear all
alpha = 0;
beta = 0;
L = pi;

dxvec = [];
errorvec = [];

for k=2:10
    N=2^k;
    f = fvec(L,N);
    yapprox = twopBVP(f, alpha, beta, L, N);
    yapprox = [alpha; yapprox; beta];
    dx = L/(N+1);
    x=0:dx:L;
    trueval = -sin(x);
    error = sqrt(dx)*norm(trueval-yapprox');
    dxvec = [dxvec, dx];
    errorvec = [errorvec, error];
end
    
loglog(1./dxvec,errorvec)
grid on;
set(gca,'FontSize',15)
xlabel('N');
ylabel('Error');

%% Task 1.2, Beam equation
clear all
format long
L = 10;
N = 999;
E = 1.9*1e11;
alpha = 0;
beta = 0;
q = qvec(L,N);

dx=L/(N+1);
M = twopBVP(q, alpha, beta, L, N);
I = [];
x = [];
for i=0:dx:L
    I = [I; 1e-3*(3-2*(cos(pi*i/L))^(12))];
    x = [x,i];
end
I(1) = [] ; % remove the first and last value.
I(end) = []; 


u = twopBVP(M./(E*I), alpha, beta, L, N);
u = [alpha;u;beta];
u(501)

plot(x,u')
grid on;
set(gca,'FontSize',15)
xlabel('x, [m]');
ylabel('Beam deflection, u [m]');




