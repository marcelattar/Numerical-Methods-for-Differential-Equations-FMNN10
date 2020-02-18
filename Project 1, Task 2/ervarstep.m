function ervarstep(f,uold,told,tnew)

Steplength = [];
Globalerror = [];

for k=1:20;
    N = 2^k;
    steplength = (tnew-told)/N;
    [app,err]= RK4integrate(f, uold, told, tnew, N);
    Steplength = [Steplength, steplength];
    Globalerror = [Globalerror, err];
end

loglog(Steplength,Globalerror)
set(gca,'FontSize',15)
grid on;
xlabel('Stepsize, h');
ylabel('Global error');
end
