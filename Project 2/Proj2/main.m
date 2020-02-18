%% main 1.1
clear all;
N = 100;
alpha = 0;
beta = 0;
L = pi;
f = fvec(L,N);

y = twopBVP(f, alpha, beta, L, N)
y = [alpha; y; beta]


x = [0: 1/(N+1) :1]'

plot(x, y);


%% 1.1 b) plotta error
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
    
loglog(dxvec, errorvec)
grid on;
set(gca,'FontSize',15)
xlabel('Stepsize, \Deltax');
ylabel('Error');

%% Task 1.2


clear all;

alpha = 0;
beta = 0;
L = 10;

N=999;
dx = L/(N+1);
x = [0:dx:L];

mbiss = Mbiss(L,N);

M = twopBVP(mbiss, alpha, beta, L, N);

E = 1.9*10^11;
ubiss = [];
m = 1;

for n = 0: L/(N+1): L
    
    
    ubiss = [ubiss; M(m)./((10^(-3)*(3-2*(cos(n*pi/L))^12)))];
    
    
    m = m + 1;
end

ubiss(1) = [];
ubiss(end) = [];

u = twopBVP(ubiss, alpha, beta, L, N);
u = [alpha; u; beta];




