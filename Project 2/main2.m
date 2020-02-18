%% Task 2.1a
clear all

i=1;
for l=2:10
    N = 2^l;
    dx = 1/(N+1);
    [eigenmatrix,lambdaApprox] = SturmSolver(N);
    
    for k=1:3
        lambdatrue = -(k*pi)^2;
        errormatrix(k,i) = lambdaApprox(k)-lambdatrue;
    end
    
    Nvec(i) = N;
    i = i+1;
end
    
loglog(Nvec, errormatrix)
legend('\lambda_1','\lambda_2','\lambda_3');
grid on
set(gca,'FontSize',15)
xlabel('N');
ylabel('Error');

%% Task 2.1b 
clear all
format long
N = 499;
[eigenmatrix,lambdaApprox] = SturmSolver(N);

for k = 1:3
    vec(k) = lambdaApprox(k);
    lambdatrue(k) = -(k*pi)^2;
end
vec
lambdatrue
%% Task 2.1c
clear all
N = 499;
dx = 1/(N+1);
[eigenmatrix,lambdaApprox] = SturmSolver(N);
x=0:dx:1;

hold on
grid on
for k=0:2
    eigenvector = eigenmatrix(:,end-k)'; % Takes out the eigenmodevector
    eigenvector = [0, eigenvector, 0];   % Appends the Boundary values
    plot(x,eigenvector)                  % Plot for the three first eigenmodes
end
legend('\psi_1','\psi_2','\psi_3');
set(gca,'FontSize',15)
xlabel('x');
ylabel('\psi(x)');
%% Task 2.2
clear all
close all;
N=499;

V = Vvec(N);
Energivec = Schrod(V, N);

Va = [0, V, 0];
x=0:1/(N+1):1;
plot(x,Va)