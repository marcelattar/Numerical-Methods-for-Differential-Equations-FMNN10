function [approximate,error] = RK4integrate(f, uold, told, tnew, N)

ynew = 0;
koeff = uold;
steplength = (tnew - told)/N;

for n=1:N;
    ynew = RK4step(f,uold,told,steplength);
    uold = ynew;
end

approximate = ynew;

trueval= expm(0.2*(tnew-told))*koeff;
error = norm(approximate-trueval);


end