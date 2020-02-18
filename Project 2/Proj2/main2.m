%% Task 2.1

N = 100;

%alpha = 0;
%beta = 0;

for k = 1:3
    
    errorvec = [];
    Nvec = [];
    
    for n = 1:10
    
        
    N = 2^n;
    %dx = 1/(N+1);
    
    if(k==3 && N==2)
        
        N=3
        
    end
    
    [V, lambdaapprox] = sturmsolver(N);
    
    
    A = lambdaapprox(end+1-k,end+1-k) + (k^2)*(pi)^2;
    
    Nvec = [Nvec N];
    errorvec = [errorvec A];
    
    end
    
    loglog(Nvec, errorvec)
    grid on
    hold on
    Nvec=[];
    errorvec=[];
    
end


%% Task 2.1 b) 

clear all
format long
N = 499;
[V, lambdaapprox] = sturmsolver(N);
A = [];

for k = 1:3

    A = [A lambdaapprox(end+1-k,end+1-k)];
    
end

A


%% Task 2.2

clear all
N = 499;
[eigenv, EV] = sturmsolver(N);
A = [];
dx = 1/(N+1);
xvec = 0:dx:1;
xvec(1) = [];
xvec(end) = [];

for k = 1:3  
    
   plot(xvec, eigenv(:,end+1-k))
   grid on
   hold on
end


